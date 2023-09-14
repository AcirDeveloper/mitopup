// import 'package:flutter/cupertino.dart';
//
// import '../../../data/datasources/user_db_datasource.dart';
// import '../../../data/entities/users_entity.dart';
//
// class UsersProvider extends ChangeNotifier {
//   List<UsersEntity> users = [];
//
//   Future<void> getUserDataProvider(String userId) async {
//     final getUserData = await UsersDBDatasource().getUserData(userId);
//     users = getUserData;
//     notifyListeners();
// // Poner la siguiente linea donde quiero que escuche el cambio
// // final usersProvider = context.watch<UsersProvider>();
//   }
// }
