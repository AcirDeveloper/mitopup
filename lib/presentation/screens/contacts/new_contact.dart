// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:mitopup/config/theme/theme.dart';

class NuevoContacto extends StatefulWidget {
  const NuevoContacto({super.key});

  @override
  _NuevoContactoState createState() => _NuevoContactoState();
}

class _NuevoContactoState extends State<NuevoContacto> {
  final String _selectedLanguage = 'Español (MX)';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: DashAppBarDelete(
      //   title: 'ejemplo';// Literals.of(context).language,
      //   deleteOnPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
      body: Padding(
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
