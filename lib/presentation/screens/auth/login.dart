// ignore_for_file: prefer_final_fields, avoid_print, use_build_context_synchronously, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:mitopup/presentation/screens/recovery/recovery_pass.dart';

import '../../../config/config.dart';
import '../../../generated/l10n.dart';
import '../dashboard/dashboard.dart';
import '../screens.dart';

class LoginScreen extends StatefulWidget {
  final String idPais;
  final String phoneNumber;
  final int userId;
  final String name;

  const LoginScreen({
    Key? key,
    required this.idPais,
    required this.phoneNumber,
    required this.userId,
    required this.name,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<int?> pinNumbers = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    initPinNumbers();
  }

  void initPinNumbers() {
    pinNumbers = List<int?>.filled(4, null);
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
        loginApp(pin, widget.userId);
      }
    }
  }

  Future<void> loginApp(String pin, int userId) async {
    try {
      final response = await http.post(
        Uri.parse('http://5.161.187.55:8080/app.loginApp'),
        body: {
          'pin': pin,
          'idUser': userId.toString(),
        },
      );
      if (response.statusCode == 200) {
        final responseData = response.body;
        print('Login response: $responseData');
        if (responseData == 'OK') {
          // Login successful, navigate to DashboardScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Dashboard()),
          );
        } else {
          // PIN is incorrect
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('El PIN no es correcto.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Aceptar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      clearPinNumbers();
                    },
                  ),
                ],
              );
            },
          );
        }
      } else {
        print('Error en la solicitud al webservice');
      }
    } catch (error) {
      print('Error de conexión o en el formato de la respuesta');
      print('Error details: $error');
    }
  }

  void removeLastPinNumber() {
    final lastIndex = pinNumbers.lastIndexWhere((element) => element != null);
    if (lastIndex != -1) {
      setState(() {
        pinNumbers[lastIndex] = null;
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
                  Literals.of(context).hello(widget.name),
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
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecoveryPassScreen(
                          idPais: widget.idPais,
                          phoneNumber: widget.phoneNumber,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    Literals.of(context).forgetCode,
                    style: const TextStyle(
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
