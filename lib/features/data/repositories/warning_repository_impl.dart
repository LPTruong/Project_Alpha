import 'package:project_alpha/core/error/exception.dart';
import 'package:project_alpha/core/network/network_info.dart';
import 'package:project_alpha/features/data/models/warning_model.dart';
import 'package:project_alpha/features/domain/entities/warning.dart';
import 'package:project_alpha/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:project_alpha/features/domain/repositories/warnings_repository.dart';

import '../datasources/warning_local_data_source.dart';
import '../datasources/warning_remote_data_source.dart';


typedef Future<Unit> DeleteOrUpdateOrAddWarning();

class WarningRepositoryImpl implements WarningRepository {
  final WarningRemoteDataSource remoteDataSource;
  final WarningLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WarningRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Warning>>> getAllWarnings() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWarnings = await remoteDataSource.getAllWarnings();
        localDataSource.cacheWarnings(remoteWarnings);
        return Right(remoteWarnings);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWarnings = await localDataSource.getCachedWarnings();
        return Right(localWarnings);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addWarning(Warning warning) async {
    final WarningModel warningModel = WarningModel(
      id: warning.id,
      title: warning.title,
      content: warning.content,
      level: warning.level,
      category: warning.category,
      image: warning.image,
      createAt: warning.createAt,
      author: warning.author,
    );
    return await _getMessage(() {
      return remoteDataSource.addWarning(warningModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteWarning(String warningId) async {
    return await _getMessage(() {
      return remoteDataSource.deleteWarning(warningId);
    });
  }

  @override
  Future<Either<Failure, Unit>> updateWarning(Warning warning) async {
    final WarningModel warningModel = WarningModel(
      id: warning.id,
      title: warning.title,
      content: warning.content,
      level: warning.level,
      category: warning.category,
      image: warning.image,
      createAt: warning.createAt,
      author: warning.author,
    );
    return await _getMessage(() {
      return remoteDataSource.updateWarning(warningModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      DeleteOrUpdateOrAddWarning deletedOrUpdateOrAddWarning) async {
    if (await networkInfo.isConnected) {
      try {
        await deletedOrUpdateOrAddWarning();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
