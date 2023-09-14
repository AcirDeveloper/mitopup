import '../../domain/data.dart';

class UserDataResponseModel {
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

  UserDataResponseModel({
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

  factory UserDataResponseModel.fromJsonMap(Map<String, dynamic> json) =>
      UserDataResponseModel(
        idUser: json["idUser"],
        firstName: json["nombre"],
        lastName: json["apellido"],
        email: json["email"],
        phone: json["telefono"],
        codeCountry: json["codeCountry"],
        codePromos: json["codePromos"],
        pinAccess: json["pinUser"],
        allowCommunications: json["check_comunication"],
        acceptTermsAndConditions: json["check_terms"],
        idLanguage: json["idLanguage"],
      );

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "codeCountry": codeCountry,
        "codePromos": codePromos,
        "pinAccess": pinAccess,
        "allowCommunications": allowCommunications,
        "acceptTermsAndConditions": acceptTermsAndConditions,
        "idLanguage": idLanguage,
      };

  UsersEntity toUsersEntity() => UsersEntity(
        idUser: idUser,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        codeCountry: codeCountry,
        codePromos: codePromos,
        pinAccess: pinAccess,
        allowCommunications: allowCommunications == "si" ? true : false,
        acceptTermsAndConditions:
            acceptTermsAndConditions == "si" ? true : false,
        idLanguage: idLanguage,
      );
}
