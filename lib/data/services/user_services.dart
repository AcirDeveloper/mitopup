import 'package:dio/dio.dart';
import '../../config/config.dart';
import '../data.dart';

class UserServices extends UsersRepository {
  static final dio = Dio(BaseOptions(baseUrl: Environment.url));

  @override
  Future<UsersEntity> fetchUser(int idPais, String phoneNumber) {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }
}
