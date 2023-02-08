import 'package:dartz/dartz.dart';
import 'package:project_alpha/features/domain/repositories/warnings_repository.dart';

import '../../../core/error/failures.dart';
import '../entities/warning.dart';

class AddWarningUseCase {
  final WarningsRepository repository;

  AddWarningUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Warning warning) async {
    return await repository.addWarning(warning);
  }
}
