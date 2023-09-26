import 'package:dio/dio.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:convert';

import '../../config/config.dart';
import '../data.dart';

class ContactServices {
  static final Dio dio = Dio(BaseOptions(baseUrl: Environment.url));

  static Future<List<ContactEntity>> fetchContacts(String idUser) async {
    try {
      final response = await dio.get('/app.getContactos', queryParameters: {
        'idUsuario': idUser,
      });
      print(response.data);
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        List<ContactEntity> contacts = [];
        for (var item in data) {
          final encodedNameContact = item['nombreContacto']?.toString() ?? '';
          final nameContact = utf8.decode(encodedNameContact.runes.toList());
          final codeCountry = item['codPais']?.toString() ?? '';
          final phoneContact = item['telefono']?.toString() ?? '';
          var colorContact = item['color']?.toString() ?? '';

          try {
            // Intenta convertir el valor de color a un número hexadecimal
            if (colorContact.isNotEmpty && colorContact[0] == '#') {
              HexColor(colorContact);
            } else {
              throw Exception('Error en la conversión de color: $colorContact');
            }
          } catch (e) {
            print('Error en la conversión de color: $colorContact');
            // Asigna un color predeterminado en caso de error
            const defaultColor = '#B0E0E6';
            colorContact = defaultColor;
          }

          contacts.add(ContactEntity(
            nameContact: nameContact,
            phoneContact: phoneContact,
            colorContact: colorContact,
            codeCountry: codeCountry,
          ));
        }

        return contacts;
      } else {
        throw Exception('Error getting contacts from webservice');
      }
    } catch (e) {
      throw Exception('Error fetching contacts: $e');
    }
  }
}
