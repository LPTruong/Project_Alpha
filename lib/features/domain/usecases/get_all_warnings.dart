import 'package:dartz/dartz.dart';
import 'package:project_alpha/features/domain/entities/warning.dart';
import 'package:project_alpha/features/domain/repositories/warnings_repository.dart';

import '../../../core/error/failures.dart';

class GetAllWarningsUsecase{
  final WarningsRepository repository;

  GetAllWarningsUsecase(this.repository);

  Future<Either<Failure, List<Warning>>> call() async {
    return await repository.getAllWarnings();
  }

}