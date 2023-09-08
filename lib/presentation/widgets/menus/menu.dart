import 'package:flutter/material.dart';

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menú Principal',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            title: const Text('Página 1'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/pagina1');
            },
          ),
          ListTile(
            title: const Text('Página 2'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/pagina2');
            },
          ),
          ListTile(
            title: const Text('Página 3'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/pagina3');
            },
          ),
        ],
      ),
    );
  }
}
