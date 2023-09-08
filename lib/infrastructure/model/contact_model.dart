import 'dart:convert';

ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
  int idContacto;
  String nombre;
  String telefono;
  String email;
  String phoneNumber;
  String color;
  int userId;
  String name;

  ContactModel({
    required this.idContacto,
    required this.nombre,
    required this.telefono,
    required this.email,
    required this.phoneNumber,
    required this.color,
    required this.userId,
    required this.name,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    idContacto: json["idContacto"],
    nombre: json["nombre"],
    telefono: json["telefono"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    color: json["color"],
    userId: json["userId"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "idContacto": idContacto,
    "nombre": nombre,
    "telefono": telefono,
    "email": email,
    "phoneNumber": phoneNumber,
    "color": color,
    "userId": userId,
    "name": name,
  };
}
