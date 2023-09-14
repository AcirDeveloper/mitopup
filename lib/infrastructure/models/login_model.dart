import '../../domain/data.dart';

class LoginDataResponseModel {
  final String codPais;
  final String telefono;
  final int pin;

  LoginDataResponseModel({
    required this.codPais,
    required this.telefono,
    required this.pin,
  });

  factory LoginDataResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginDataResponseModel(
        codPais: json["codPais"],
        telefono: json["telefono"],
        pin: json["pin"],
      );

  Map<String, dynamic> toJson() => {
        "codPais": codPais,
        "telefono": telefono,
        "pin": pin,
      };

  LoginEntity toLoginEntity() => LoginEntity(
        codeCountry: codPais,
        phone: telefono,
        pinAccess: pin,
        token: '',
      );
}
