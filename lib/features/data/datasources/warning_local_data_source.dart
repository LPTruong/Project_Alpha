import 'package:dartz/dartz.dart';
import 'package:project_alpha/features/data/models/warning_model.dart';

abstract class WarningLocalDataSource{
  Future<List<WarningModel>> getCachedWarnings();
  Future<Unit> cacheWarnings(List<WarningModel> warningModels);

}

class WarningLocalDataSourceImpl implements WarningLocalDataSource{
  @override
  Future<Unit> cacheWarnings(List<WarningModel> warningModels) {
    // TODO: implement cacheWarnings
    throw UnimplementedError();
  }

  @override
  Future<List<WarningModel>> getCachedWarnings() {
    // TODO: implement getCachedWarnings
    throw UnimplementedError();
  }

}