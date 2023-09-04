import 'package:flutter/material.dart';
import 'package:mitopup/config/theme/theme.dart';
import 'package:mitopup/generated/l10n.dart';



class EditarContacto extends StatefulWidget {
  @override
  _EditarContactoState createState() => _EditarContactoState();
}

class _EditarContactoState extends State<EditarContacto> {
  String _selectedLanguage = 'Español (MX)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lightAppBarAyuda(
        title: Literals.of(context).idioma,
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
                  Center(child: Text('Hola, mundo!'),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}