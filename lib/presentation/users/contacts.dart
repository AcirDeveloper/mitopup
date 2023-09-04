import 'package:flutter/material.dart';
import 'package:mitopup/config/theme/theme.dart';
import 'package:mitopup/generated/l10n.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math'; // Importa la librería 'dart:math' para usar la clase 'Random'

class Contacto {
  final int idContacto;
  final String nombre;
  final String telefono;

  Contacto({
    required this.idContacto,
    required this.nombre,
    required this.telefono,
  });
}

class Contactos extends StatefulWidget {
  @override
  _ContactosState createState() => _ContactosState();
}

class _ContactosState extends State<Contactos> {
  List<Contacto> _contactos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final idUsuario = "4"; // Cambiado a String, como se usa en el _fetchContactos
      _fetchContactos(idUsuario);
    });
  }

  Future<void> _fetchContactos(String idUsuario) async {
    final url = Uri.parse('http://5.161.187.55:8080/app.getContactos?idUsuario=$idUsuario');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Contacto> contactos = [];
      for (var item in data) {
        contactos.add(Contacto(
          idContacto: item['idContacto'],
          nombre: item['nombreContacto'],
          telefono: item['telefono'],
        ));
      }
      setState(() {
        _contactos = contactos;
        isLoading = false;
      });
    } else {
      throw Exception('Error al obtener los contactos del webservice');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lightAppBarAyuda(
        title: Literals.of(context).contactos,
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
                      contacto.nombre.substring(0, 1).toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    contacto.nombre,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    contacto.idContacto.toString(),
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
