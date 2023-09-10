// ignore_for_file: library_private_types_in_public_api, unused_field, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

import 'package:mitopup/config/theme/theme.dart';

import '../../../data/entities/contact_entity.dart';
// Importa la librería 'dart:math' para usar la clase 'Random'

// Todo: contactos.- idContacto, nombreContacto, telefono

class Contactos extends StatefulWidget {
  const Contactos({super.key});

  @override
  _ContactosState createState() => _ContactosState();
}

class _ContactosState extends State<Contactos> {
  List<ContactEntity> _contactos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      const idUsuario =
          "4"; // Cambiado a String, como se usa en el _fetchContactos
      _fetchContactos(idUsuario);
    });
  }

  Future<void> _fetchContactos(String idUsuario) async {
    final url = Uri.parse(
        'http://5.78.79.129:8080/app.getContactos?idUsuario=$idUsuario');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<ContactEntity> contactos = [];

      setState(() {
        _contactos = contactos;
        _isLoading = false;
      });
    } else {
      throw Exception('Error al obtener los contactos del webservice');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBarAyuda(
        title: 'ejemplo', //Literals.of(context).contacts,
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Wrap(
          spacing: 10, // Espacio horizontal entre los contactos
          runSpacing: 10, // Espacio vertical entre las filas de contactos
          children: _contactos.map((contacto) {
            final randomColor = getRandomColor();
            return Container(
              width: 80,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: HexColor(randomColor),
                    child: Text(
                      contacto.nameContact.substring(0, 1).toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    contacto.nameContact,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    contacto.idContact.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  String getRandomColor() {
    final random = Random();
    final color = random.nextInt(0xFFFFFF);
    return '#${color.toRadixString(16).padLeft(6, '0')}';
  }
}
