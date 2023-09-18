import '../data.dart';

abstract class UsersRepository {
  Future<UsersEntity> fetchUser(int idPais, String phoneNumber);
}
