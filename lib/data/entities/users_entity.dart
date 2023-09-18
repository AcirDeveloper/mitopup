class UsersEntity {
  final int idUser;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String codeCountry;
  final String codePromos;
  final int pinAccess;
  final bool allowCommunications;
  final bool acceptTermsAndConditions;
  final int idLanguage;
  final int idPais;

  UsersEntity({
    required this.idUser,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.codeCountry,
    required this.codePromos,
    required this.pinAccess,
    required this.allowCommunications,
    required this.acceptTermsAndConditions,
    required this.idLanguage,
    required this.idPais,
  });
}

class LoginEntity {
  final String codeCountry;
  final String phone;
  final int pinAccess;
  final String token;

  LoginEntity({
    required this.codeCountry,
    required this.phone,
    required this.pinAccess,
    required this.token,
  });
}
