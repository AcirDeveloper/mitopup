import 'dart:convert';

import 'package:mitopup/config/constants/environment.dart';
import 'package:mitopup/domain/datasources/mitopup_datasource.dart';
import 'package:mitopup/domain/entities/entities.dart';
import 'package:dio/dio.dart';

class MitopupdbDatasource extends ContactsDataSource {
  // Mi base url: http:5.78.79.129:8080
  final dio = Dio(BaseOptions(baseUrl: Environment.url));

  @override
  Future<List<ContactEntity>> getContacts() async {
    final response = await dio.get('/contacts');
    return [];
  }
}
