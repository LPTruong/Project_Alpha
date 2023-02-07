import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:project_alpha/core/error/exception.dart';
import 'package:project_alpha/features/data/models/warning_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class WarningLocalDataSource {
  Future<List<WarningModel>> getCachedWarnings();
  Future<Unit> cacheWarnings(List<WarningModel> warningModels);
}

const CACHED_WARNINGS  = "CACHED_WARNINGS";


class WarningLocalDataSourceImpl implements WarningLocalDataSource {
  final SharedPreferences sharedPreferences;

  WarningLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheWarnings(List<WarningModel> warningModels) {
    List warningModelsToJson = warningModels
        .map<Map<String, dynamic>>((warningModels) => warningModels.toJson())
        .toList();
    sharedPreferences.setString(
        CACHED_WARNINGS, json.encode(warningModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<WarningModel>> getCachedWarnings() {
    final jsonString = sharedPreferences.getString(CACHED_WARNINGS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<WarningModel> jsonToWarningModels = decodeJsonData
          .map<WarningModel>(
              (jsonWarningModel) => WarningModel.fromJson(jsonWarningModel))
          .toList();
        return Future.value(jsonToWarningModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
