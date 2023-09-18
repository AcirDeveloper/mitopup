// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mitopup/config/config.dart';

import '../../../generated/l10n.dart';
import '../../screens/screens.dart';

class PinScreen extends StatefulWidget {
  static const String name = 'pins-screen';

  const PinScreen(
      {super.key, required String phoneNumber, required String idPais});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  List<int?> pinNumbers = [];
  final bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    initPinNumbers();
  }

  void initPinNumbers() {
    setState(() {
      pinNumbers = List<int?>.filled(4, null);
    });
  }

  void addPinNumber(int number) {
    final emptyIndex = pinNumbers.indexWhere((element) => element == null);
    if (emptyIndex != -1) {
      setState(() {
        pinNumbers[emptyIndex] = number;
      });
      if (emptyIndex == 3) {
        // When the last number is entered
        final pin = pinNumbers.map((number) => number.toString()).join();
        // loginApp(pin, widget.userId);
      }
    }
  }

  void removeLastPinNumber() {
    final filledIndex = pinNumbers.lastIndexWhere((element) => element != null);
    if (filledIndex != -1) {
      setState(() {
        pinNumbers[filledIndex] = null;
      });
      print('Pin numbers after removing: $pinNumbers');
    }
  }

  void clearPinNumbers() {
    setState(() {
      pinNumbers = List<int?>.filled(4, null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginAppBar(
        title: 'Cerrar Sesión',
        actionIcon: Icons.logout,
        actionOnPressed: () {
          // Lógica para el botón de cierre de sesión
        },
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16.0, 43.0, 16.0, 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Literals.of(context).hello('Maria'),
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    height: 19 / 38,
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  'Introduce tu PIN para acceder',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: HexColor("#34405F"),
                    height: 24 / 16,
                  ),
                ),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pinNumbers
                      .map(
                        (number) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CircleAvatar(
                            radius: 12.0,
                            backgroundColor: (number != null)
                                ? const Color(0xFF005CEE)
                                : const Color(0xFFECECEC),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16.0),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16.0),
                      Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            KeypadRow(
                                numbers: const [1, 2, 3],
                                onPressed: addPinNumber),
                            KeypadRow(
                                numbers: const [4, 5, 6],
                                onPressed: addPinNumber),
                            KeypadRow(
                                numbers: const [7, 8, 9],
                                onPressed: addPinNumber),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(width: 53.0),
                                KeypadButton(
                                  number: 0,
                                  onPressed: addPinNumber,
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_back,
                                      size: 30.0, color: HexColor("#005CEE")),
                                  onPressed: () {
                                    print(
                                        'Pin numbers before removing: $pinNumbers');
                                    removeLastPinNumber();
                                    print(
                                        'Pin numbers after removing: $pinNumbers');
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '¿Has olvidado tu código?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.6),
                child: const Center(
                  child:
                      Loader(), // Usamos el Loader que creamos en "theme.dart"
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class KeypadRow extends StatelessWidget {
  final List<int> numbers;
  final void Function(int) onPressed;

  const KeypadRow({
    Key? key,
    required this.numbers,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: numbers
          .map(
            (number) => KeypadButton(
              number: number,
              onPressed: onPressed,
            ),
          )
          .toList(),
    );
  }
}

class KeypadButton extends StatelessWidget {
  final int number;
  final void Function(int) onPressed;

  const KeypadButton({
    Key? key,
    required this.number,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      child: TextButton(
        onPressed: () => onPressed(number),
        child: Text(
          number.toString(),
          style: TextStyle(
            fontSize: 30.0,
            color: HexColor("#005CEE"),
          ),
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
    required Null Function() onPressed,
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
