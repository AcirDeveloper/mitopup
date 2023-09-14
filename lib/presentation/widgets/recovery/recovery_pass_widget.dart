import 'package:flutter/material.dart';

class RecoveryPasswordScreen extends StatelessWidget {
  const RecoveryPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Contraseña'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Agrega la lógica para cerrar la pantalla aquí
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Introduce el código de 4 dígitos que hemos enviado a +52-xxx-xxx-841',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Cuatro cuadraditos con borde y un "X"
                for (int i = 0; i < 4; i++)
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'X',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Agrega la lógica para "¿No recibiste el código?" aquí
              },
              child: const Text('¿No recibiste el código?'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Agrega la lógica para "Solicitar nuevo código (0:59)" aquí
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.all(5),
              ),
              child: const Text('Solicitar nuevo código (0:59)',
                  style: TextStyle(color: Colors.blue)),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Agrega la lógica para el botón de confirmar aquí
              },
              child: const Text('Confirmar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
