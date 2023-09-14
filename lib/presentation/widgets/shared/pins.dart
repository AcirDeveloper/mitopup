import 'package:flutter/material.dart';
import 'package:mitopup/config/config.dart';

class PinScreen extends StatelessWidget {
  static const String name = 'pins-screen';

  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset(AppImages.iconLogo, width: 40),
            const SizedBox(width: 8),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Lógica para cerrar sesión
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. Nombre de la Persona en la Parte Superior
            const Text(
              '¡Nombre de la Persona!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Introduce tu PIN para acceder',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            //hr poner un hr en flutter
            const SizedBox(height: 20),

            // 2. Círculos para el PIN
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleIndicator(isFilled: false),
                CircleIndicator(isFilled: false),
                CircleIndicator(isFilled: false),
                CircleIndicator(isFilled: false),
              ],
            ),
            const SizedBox(height: 20),

            // 3. Teclado Numérico
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 12, // 12 para incluir el botón "<-"
                itemBuilder: (context, index) {
                  if (index == 9) {
                    return TextButton(
                      onPressed: () {
                        // Lógica para borrar un dígito
                      },
                      // nulo o desabilidado
                      child: const Text(''),
                    );
                  } else if (index == 11) {
                    return const Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.blue,
                    );
                  } else if (index == 10) {
                    return const NumButton(number: '0');
                  } else {
                    return NumButton(number: '${index + 1}');
                  }
                },
              ),
            ),

            // 4. Botón "¿Has Olvidado tu PIN?"
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para manejar "¿Has Olvidado tu PIN?"
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Color de fondo gris
                elevation: 0,
              ),
              // subrayado gris
              child: const Text('¿Has Olvidado tu PIN?',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline)),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleIndicator extends StatelessWidget {
  final bool isFilled;

  const CircleIndicator({super.key, required this.isFilled});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isFilled ? Colors.blue : Colors.grey,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
    );
  }
}

class NumButton extends StatelessWidget {
  final String number;

  const NumButton({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Lógica para manejar la pulsación del número
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(5),
        elevation: 0,
        backgroundColor: Colors.transparent,
        side: const BorderSide(color: Colors.transparent, width: 1),
      ),
      child: Text(
        number,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.blue, // Texto azul
        ),
      ),
    );
  }
}
