// import 'package:dio/dio.dart';
//
// import '../../config/config.dart';
// import '../../domain/data.dart';
// import '../infrastructure.dart';
//
// class UsersDBDatasource {
//   final dio = Dio(BaseOptions(
//     baseUrl: Environment.url,
//   ));
//
//   Future<List<UsersEntity>> getUserData(String userId) async {
//     final response = await dio.get('/app.getUserName?userId=$userId');
//     final userDataResponse = UserDataResponseModel.fromJson(response.data);
//
//     return [userDataResponse.toUsersEntity()];
//   }
//
//   Future<LoginEntity> postLoginData() async {
//     final response = await dio.post('/authFunction.loginMitopupForm');
//     final userDataResponse = LoginDataResponseModel.fromJson(response.data);
//
//     return userDataResponse.toLoginEntity();
//   }
// }
