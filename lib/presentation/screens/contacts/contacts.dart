// ignore_for_file: library_private_types_in_public_api, unused_field, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import '../../../config/config.dart';
import '../../../data/data.dart';
import '../../../generated/l10n.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<ContactEntity> contacts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      const idUser =
          "35"; // Cambiado a String, como se usa en el _fetchContactos
      loadContacts(idUser);
    });
  }

  Future<void> loadContacts(String idUser) async {
    setState(() {
      isLoading = true;
    });

    try {
      final loadedContacts = await ContactServices.fetchContacts(idUser);
      setState(() {
        contacts = loadedContacts;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading contacts: $e');
      // Maneja el error de carga aquí
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBarAyuda(
        title: Literals.of(context).contacts,
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Wrap(
          spacing: 10, // Espacio horizontal entre los contactos
          runSpacing: 10, // Espacio vertical entre las filas de contactos
          children: contacts.map((contact) {
            final randomColor = getRandomColor();
            return Container(
              width: 80,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: HexColor(randomColor),
                    child: Text(
                      contact.nameContact.substring(0, 1).toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    contact.nameContact,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    contact.idContact.toString(),
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
