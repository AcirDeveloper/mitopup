import 'package:dio/dio.dart';
import '../../config/config.dart';

class UserServices {
  static final dio = Dio(BaseOptions(baseUrl: Environment.url));

  static Future<Map<String, String>> fetchUserData(String idUser) async {
    try {
      final response = await dio.get('/app.getUserName', queryParameters: {
        'userId': idUser,
      });

      if (response.statusCode == 200) {
        final data = response.data;
        final userData = {
          'userName': data[0]['nombre']?.toString() ?? '',
          'phoneNumber': data[0]['telefono']?.toString() ?? '',
          'email': data[0]['email']?.toString() ?? '',
        };
        return userData;
      } else {
        throw Exception('Error getting user data from webservice');
      }
    } catch (e) {
      print(e);
      throw Exception('Error getting user data from webservice');
    }
  }
}
