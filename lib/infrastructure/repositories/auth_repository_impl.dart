import '../../domain/data.dart';
import '../infrastructure.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepositoryImpl({AuthDatasource? authDatasource})
      : authDatasource = authDatasource ?? AuthDataSourceImpl();

  @override
  Future<UsersEntity> checkAuthStatus(String token) {
    return authDatasource.checkAuthStatus(token);
  }

  @override
  Future<UsersEntity> login(String codeCountry, String phone, int pinAccess) {
    return authDatasource.login(codeCountry, phone, pinAccess);
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
    return authDatasource.register(
      firstName,
      lastName,
      email,
      phone,
      codeCountry,
      codePromos,
      pinAccess,
      allowCommunications,
      acceptTermsAndConditions,
      idLanguage,
    );
  }
}
