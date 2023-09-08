// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:mitopup/config/theme/theme.dart';
import 'package:mitopup/generated/l10n.dart';

class EditarContacto extends StatefulWidget {
  const EditarContacto({super.key});

  @override
  _EditarContactoState createState() => _EditarContactoState();
}

class _EditarContactoState extends State<EditarContacto> {
  final String _selectedLanguage = 'Español (MX)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBarAyuda(
        title: Literals.of(context).language,
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 45),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text('Hola, mundo!'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
