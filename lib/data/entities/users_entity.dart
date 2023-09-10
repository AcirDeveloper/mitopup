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
  });
}
