import '../data.dart';

abstract class AuthRepository {
  Future<UsersEntity> login(String codeCountry, String phone, int pinAccess);

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
    int idLanguage,
  );

  Future<UsersEntity> checkAuthStatus(String token);
}
