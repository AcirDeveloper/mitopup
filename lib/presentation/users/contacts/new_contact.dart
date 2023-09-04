import 'package:flutter/material.dart';
import 'package:mitopup/config/theme/theme.dart';
import 'package:mitopup/generated/l10n.dart';



class NuevoContacto extends StatefulWidget {
  @override
  _NuevoContactoState createState() => _NuevoContactoState();
}

class _NuevoContactoState extends State<NuevoContacto> {
  String _selectedLanguage = 'Español (MX)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashAppBarDelete(
        title: Literals.of(context).idioma,
        deleteOnPressed: () {
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