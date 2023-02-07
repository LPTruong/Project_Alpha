import 'package:dartz/dartz.dart';
import 'package:project_alpha/core/error/failures.dart';

import '../repositories/warnings_repository.dart';

class DeleteWarningUseCase {
  final WarningRepository repository;
  
  DeleteWarningUseCase(this.repository);

  Future<Either<Failure, Unit>>  call(String warningId) async {
    return await repository.deleteWarning(warningId);
  }
}