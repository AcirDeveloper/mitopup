import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';

import 'package:mitopup/generated/l10n.dart';
import 'package:mitopup/config/theme/theme.dart';
import 'package:mitopup/presentation/screens/login.dart';

class Country {
  final int id;
  final String name;
  final String code;
  final String flagUrl;
  final int digitos;

  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.digitos,
    required this.flagUrl,
  });
}

class LoginPage extends StatefulWidget {
  final Function() onStep3Complete;
  final int userId; // Asegúrate de agregar esto
  final String name; // Asegúrate de agregar esto

  const LoginPage({
    super.key,
    required this.onStep3Complete,
    required this.userId,
    required this.name,
  });

  @override
  LoginPageState createState() => LoginPageState(userId: userId, name: name);
}

class LoginPageState extends State<LoginPage> {
  List<Country> countries = [];
  Country? selectedCountry;
  TextEditingController phoneNumberController = TextEditingController();
  int minDigits = 0;
  int maxDigits = 0;
  bool isPhoneNumberFilled = false;
  bool isLoading = false;

  // Agrega estos dos parámetros
  int? userId = 0;
  String? name = '';

  LoginPageState({required this.userId, required this.name});

  @override
  void initState() {
    super.initState();
    fetchCountries();
    fetchSelectedCountry(1); // ID de país predeterminado: 1
    maxDigits = 10;
  }

  Future<void> fetchCountries() async {
    try {
      final response =
          await http.get(Uri.parse('http://5.161.187.55:8080/app.listaPaises'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        final parsedCountries = data.map((item) {
          return Country(
            id: item['idPais'],
            name: item['nombre'],
            code: item['codPais'],
            flagUrl: item['bandera'],
            digitos: item['digitos'] as int,
          );
        }).toList();
        setState(() {
          countries = parsedCountries;
        });
      } else {
        // Error en la solicitud al webservice
        _showErrorDialog('Hubo un error al obtener los datos del servidor.');
      }
    } catch (error) {
      // Error de conexión o en el formato de la respuesta
      _showErrorDialog('Error de conexión o en el formato de la respuesta.');
    }
  }

  Future<void> fetchSelectedCountry(int countryId) async {
    try {
      final response = await http.get(
          Uri.parse('http://5.161.187.55:8080/app.getPais?idPais=$countryId'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        if (data.isNotEmpty) {
          final selectedData = data.first;
          setState(() {
            selectedCountry = Country(
              id: selectedData['idPais'],
              name: selectedData['nombre'],
              code: selectedData['codPais'],
              flagUrl: selectedData['bandera'],
              digitos: selectedData['digitos'] as int,
            );

            // Establecer los valores predeterminados de minDigits y maxDigits a 0
            minDigits = 10;
            maxDigits = 10;
          });

          minDigits = selectedCountry!.digitos;
          maxDigits = selectedCountry!.digitos;
          _checkPhoneNumberField();
        }
      }
    } catch (error) {
      // Error de conexión o en el formato de la respuesta
      _showErrorDialog('Error de conexión o en el formato de la respuesta.');
    }
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar el cuadro de diálogo
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _openCountrySelectionPage() async {
    final selected = await Navigator.push<Country>(
      context,
      MaterialPageRoute(
        builder: (context) => CountrySelectionPage(
          countries: countries,
          selectedCountry: selectedCountry,
        ),
      ),
    );
    if (selected != null) {
      setState(() {
        selectedCountry = selected;
        minDigits = selected.digitos;
        maxDigits = selected.digitos;
      });

      // Ajustar el número de dígitos del campo de texto según el nuevo país seleccionado
      final phoneNumber =
          phoneNumberController.text.replaceAll(RegExp(r'[^0-9]'), '');
      if (phoneNumber.length > selected.digitos) {
        phoneNumberController.text = phoneNumber.substring(0, selected.digitos);
      }
      _checkPhoneNumberField();
    }
  }

  void _checkPhoneNumberField() {
    final phoneNumber =
        phoneNumberController.text.replaceAll(RegExp(r'[^0-9]'), '');
    final previousSelection = phoneNumberController.selection;

    // Si el número de dígitos es mayor que maxDigits, lo ajustamos a maxDigits
    if (phoneNumber.length > maxDigits) {
      phoneNumberController.text = phoneNumber.substring(0, maxDigits);
    }

    // Si el número de dígitos es menor que minDigits, lo ajustamos agregando ceros a la izquierda
    if (phoneNumber.length < minDigits) {
      final zerosToAdd = minDigits - phoneNumber.length;
      phoneNumberController.text = '0' * zerosToAdd + phoneNumber;
    }

    setState(() {
      phoneNumberController.text = phoneNumber;
      isPhoneNumberFilled = phoneNumber.length >= minDigits;
    });

    phoneNumberController.selection = previousSelection;
  }

  void _navigateToLogin() async {
    final String idPais = selectedCountry?.id.toString() ?? '';
    final String phoneNumber = phoneNumberController.text;

    try {
      // Realizar la llamada al web service para verificar si el usuario existe
      final response = await http.get(
        Uri.parse(
          'http://5.161.187.55:8080/app.getUserName?idPais=$idPais&phoneNumber=$phoneNumber',
        ),
      );

      if (kDebugMode) {
        print('Response Status Code: ${response.statusCode}');
      }
      if (kDebugMode) {
        print('Response Body: ${response.body}');
      }

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;

        if (data.isNotEmpty) {
          // Usuario existe, navegamos a la pantalla de LoginScreen
          final int userId = data[0]['idUser'];
          final String name = data[0]['nombre'];

          if (kDebugMode) {
            print('User ID: $userId');
          }
          if (kDebugMode) {
            print('User Name: $name');
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(
                idPais: idPais, // Pasar el idPais a LoginScreen
                phoneNumber: phoneNumber, // Pasar el phoneNumber a LoginScreen
                userId:
                    userId, // Asegúrate de pasar estos valores correctamente
                name: name, // Asegúrate de pasar estos valores correctamente
              ),
            ),
          );
        } else {
          // Error: El usuario no existe
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('Verifica tus datos.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Aceptar'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Error en la solicitud al webservice
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Error en la solicitud al servidor.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      // Error de conexión o en el formato de la respuesta
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Error de conexión o en el formato de la respuesta.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Literals.of(context).loginTitle,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Literals.of(context).loginHint,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _openCountrySelectionPage,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(8.0),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        side: BorderSide(
                          width: 1,
                          color: HexColor("#D2D5DA"),
                        ),
                        elevation: 0,
                        minimumSize: const Size(double.infinity, 60.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            selectedCountry?.flagUrl ?? '',
                            width: 24.0,
                            height: 24.0,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            selectedCountry?.code ?? '',
                            style: TextStyle(
                              color: HexColor("#34405F"),
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: HexColor("#34405F"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: phoneNumberController,
                      onChanged: (value) {
                        _checkPhoneNumberField();
                      },
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(
                            maxDigits), // Limita la longitud de caracteres
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        hintText: 'Número de teléfono',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: HexColor("#D2D5DA"),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: HexColor("#0743DF"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: DynamicButton(
                  onTap: isPhoneNumberFilled ? _navigateToLogin : null,
                  isFilled: isPhoneNumberFilled,
                  buttonText: capitalize(Literals.of(context).btnIngresar),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 2,
                        color: HexColor("#DBDBDB"),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 15),
                        child: Text(
                          'O',
                          style: TextStyle(
                              fontSize: 24, color: HexColor("#DBDBDB")),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 2,
                        color: HexColor("#DBDBDB"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: OutlineButton(
                  onPressed: () {},
                  buttonText: Literals.of(context).btnRegister,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: TextButton(
                  onPressed: () {
                    widget.onStep3Complete();
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'Hacer recarga',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: HexColor("#0743DF"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountrySelectionPage extends StatefulWidget {
  final List<Country> countries;
  final Country? selectedCountry;

  const CountrySelectionPage({super.key,
    required this.countries,
    required this.selectedCountry,
  });

  @override
  CountrySelectionPageState createState() => CountrySelectionPageState();
}

class CountrySelectionPageState extends State<CountrySelectionPage> {
  late List<Country> filteredCountries;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCountries = widget.countries;
  }

  void filterCountries(String query) {
    setState(() {
      filteredCountries = widget.countries
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()) ||
              country.code.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(),
        ),
        title: const Center(
          child: Text(
            'País del celular',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: filterCountries,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: 'Buscar país',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: HexColor("#D2D5DA")),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: HexColor("#0743DF")),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  final country = filteredCountries[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Image.network(
                          country.flagUrl,
                          width: 24.0,
                          height: 24.0,
                        ),
                        const SizedBox(width: 8.0),
                        Text(country.name),
                        const SizedBox(width: 8.0),
                        Text(country.code),
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context, country);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
