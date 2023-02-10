import 'dart:convert';


import 'package:dartz/dartz.dart';
import 'package:project_alpha/core/error/exception.dart';
import 'package:project_alpha/features/data/models/warning_model.dart';
import 'package:http/http.dart' as http;

abstract class WarningRemoteDataSource {
  Future<List<WarningModel>> getAllWarnings();
  Future<Unit> deleteWarning(String warningId);
  Future<Unit> updateWarning(WarningModel warningModel);
  Future<Unit> addWarning(WarningModel warningModel);
}

const BASE_URL = "https://63e0b7f359bb472a74275867.mockapi.io";

class WarningRemoteDataSourceImpl implements WarningRemoteDataSource {
  final http.Client client;

  WarningRemoteDataSourceImpl({required this.client});

  @override
  Future<List<WarningModel>> getAllWarnings() async {
    final response = await client.get(Uri.parse(BASE_URL + "/warnings/"));

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;
      final List<WarningModel> warningModels = decodeJson
          .map<WarningModel>(
              (jsonWarningModel) => WarningModel.fromJson(jsonWarningModel))
          .toList();

      return warningModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addWarning(WarningModel warningModel) async {
    final body = {

      'title': warningModel.title,
      'content': warningModel.content,
      'level': warningModel.level,
      'category': warningModel.category,
      'image': warningModel.image,
      'createAt': warningModel.createAt,
      'author': warningModel.author,
    };
    final response =
        await client.post(Uri.parse(BASE_URL + "/warnings/"), body: body);
    if (response.statusCode == 201) { 
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteWarning(String warningId) async {
    final response =
        await client.delete(Uri.parse(BASE_URL + "/warnings/$warningId"));
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateWarning(WarningModel warningModel) async {
    final warningId = warningModel.id;
    final body = {
      'title': warningModel.title,
      'content': warningModel.content,
      'level': warningModel.level,
      'category': warningModel.category,
      'image': warningModel.image,
      'createAt': warningModel.createAt,
      'author': warningModel.author,
    };

    final response = await client.put(
      Uri.parse(BASE_URL + "/warnings/$warningId"),
      body: body,
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
