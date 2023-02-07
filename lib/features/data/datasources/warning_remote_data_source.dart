import 'package:dartz/dartz.dart';
import 'package:project_alpha/features/data/models/warning_model.dart';

abstract class WarningRemoteDataSource{
  Future<List<WarningModel>> getAllWarnings();
  Future<Unit> deleteWarning(String warningId);
  Future<Unit> updateWarning(WarningModel warningModel);
  Future<Unit> addWarning(WarningModel warningModel);
  
}

class WarningRemoteDataSourceImpl implements WarningRemoteDataSource{
  @override
  Future<Unit> addWarning(WarningModel warningModel) {
    // TODO: implement addWarning
    throw UnimplementedError();
  }

  @override
  Future<Unit> deleteWarning(String warningId) {
    // TODO: implement deleteWarning
    throw UnimplementedError();
  }

  @override
  Future<List<WarningModel>> getAllWarnings() {
    // TODO: implement getAllWarnings
    throw UnimplementedError();
  }

  @override
  Future<Unit> updateWarning(WarningModel warningModel) {
    // TODO: implement updateWarning
    throw UnimplementedError();
  }
  
}

 