import 'package:dio/dio.dart';
import 'package:mitopup/domain/data.dart';
import 'package:mitopup/infrastructure/errors/auth_errors.dart';

import '../../config/config.dart';
import '../models/users_model.dart';

class AuthDataSourceImpl extends AuthDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.url,
  ));

  @override
  Future<UsersEntity> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<UsersEntity> login(
      String codeCountry, String phone, int pinAccess) async {
    try {
      final response = await dio.post('/authFunction.loginMitopupForm',
          data: {'codPais': codeCountry, 'telefono': phone, 'pin': pinAccess});

      final user = UserDataResponseModel.fromJsonMap(response.data);
      return user.toUsersEntity();
    } catch (error) {
      throw WrongCredentials();
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UsersEntity> register(
      String firstName,
      String lastName,
      String email,
      String phone,
      String codeCountry,
      String codePromos,
      int pinAccess,
      bool allowCommunications,
      bool acceptTermsAndConditions,
      int idLanguage) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
