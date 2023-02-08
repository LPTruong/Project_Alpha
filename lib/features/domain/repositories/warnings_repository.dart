import 'package:dartz/dartz.dart';
import 'package:project_alpha/features/domain/entities/warning.dart';

import '../../../core/error/failures.dart';

abstract class WarningsRepository {
  Future<Either<Failure, List<Warning>>> getAllWarnings();
  Future<Either<Failure, Unit>> deleteWarning(String id);
  Future<Either<Failure, Unit>> updateWarning(Warning warning);
  Future<Either<Failure, Unit>> addWarning(Warning warning);
}
