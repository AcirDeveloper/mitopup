import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Centro de ayuda'),
      ),
      body: const _HelpCenterView(),
    );
  }
}

class _HelpCenterView extends StatelessWidget {
  const _HelpCenterView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ExpansionTile(
          title: Text('¿Como funciona el proceso de recargas?'),
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Lorem ipsum dolor sit amet psum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(fontSize: 16),
                selectionColor: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
