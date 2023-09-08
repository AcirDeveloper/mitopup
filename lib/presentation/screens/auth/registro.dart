// ignore_for_file: library_private_types_in_public_api, avoid_print, avoid_unnecessary_containers

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
import 'package:mitopup/domain/entities/entities.dart';
import 'package:mitopup/generated/l10n.dart';

import '../../../config/config.dart';

// Todo: Country mi entidad de país

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  List<CountryEntity> countries = [];
  CountryEntity? selectedCountry;
  TextEditingController phoneNumberController = TextEditingController();
  bool isPhoneNumberFilled = false;

  @override
  void initState() {
    super.initState();
    fetchCountries();
    fetchSelectedCountry(1); // ID de país predeterminado: 1
  }

  Future<void> fetchCountries() async {
    try {
      final response =
          await http.get(Uri.parse('http://5.78.79.129:8080/app.listaPaises'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        final parsedCountries = data.map((item) {
          return CountryEntity(
            id: item['idPais'],
            name: item['nombre'],
            code: item['codPais'],
            flagUrl: item['bandera'],
            digits: item['digitos'] as int,
          );
        }).toList();
        setState(() {
          countries = parsedCountries;
        });
      } else {
        // Error en la solicitud al webservice
        print('Error en la solicitud al webservice');
      }
    } catch (error) {
      // Error de conexión o en el formato de la respuesta
      print('Error de conexión o en el formato de la respuesta');
    }
  }

  Future<void> fetchSelectedCountry(int countryId) async {
    try {
      final response = await http.get(
          Uri.parse('http://5.78.79.129:8080/app.getPais?idPais=$countryId'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        if (data.isNotEmpty) {
          final selectedData = data.first;
          setState(() {
            selectedCountry = CountryEntity(
              id: selectedData['idPais'],
              name: selectedData['nombre'],
              code: selectedData['codPais'],
              flagUrl: selectedData['bandera'],
              digits: selectedData['digitos'] as int,
            );
          });
        }
      } else {
        // Error en la solicitud al webservice
        print('Error en la solicitud al webservice');
      }
    } catch (error) {
      // Error de conexión o en el formato de la respuesta
      print('Error de conexión o en el formato de la respuesta');
    }
  }

  void _openCountrySelectionPage() async {
    final selected = await Navigator.push<CountryEntity>(
      context,
      MaterialPageRoute(
        builder: (context) => CountrySelectionPage(
          countries: countries,
          selectedCountry: selectedCountry,
        ),
      ),
    );
    if (selected != null) {
      fetchSelectedCountry(selected.id);
    }
  }

  void _checkPhoneNumberField() {
    final phoneNumber =
        phoneNumberController.text.replaceAll(RegExp(r'[^0-9]'), '');
    final previousSelection = phoneNumberController.selection;
    setState(() {
      final requiredDigits = selectedCountry?.digits ?? 0;
      isPhoneNumberFilled = phoneNumber.length >= requiredDigits;
      phoneNumberController.text = phoneNumber;
    });
    phoneNumberController.selection = previousSelection;
  }

  void _navigateToLogin() {
    final String idPais = selectedCountry?.id.toString() ?? '';
    final String phoneNumber = phoneNumberController.text;
    // Simulación de recarga realizada
    print('Recarga realizada para el país $idPais y número $phoneNumber');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Literals.of(context).flow4_1,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: HexColor("#34405F"),
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  Literals.of(context).btnCel,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#34405F"),
                                    height: 1.2,
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
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      side: BorderSide(
                                        width: 1,
                                        color: HexColor("#D2D5DA"),
                                      ),
                                      elevation: 0,
                                      minimumSize: const Size(double.infinity,
                                          60.0), // Aumenta la altura del botón
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          selectedCountry?.flagUrl ?? '',
                                          width: 24.0,
                                          height: 24.0,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Text(
                                          selectedCountry?.code ?? '',
                                          style: TextStyle(
                                            color: HexColor("#34405F"),
                                            fontSize: 16,
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: HexColor(
                                              "#34405F"), // Cambia el color del icono
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
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      hintText:
                                          Literals.of(context).loginPlaceholder,
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
                            const SizedBox(height: 25.0),
                            SizedBox(
                              width: double.infinity,
                              child: DynamicButton(
                                onTap: isPhoneNumberFilled
                                    ? _navigateToLogin
                                    : null,
                                isFilled: isPhoneNumberFilled,
                                buttonText:
                                    capitalize(Literals.of(context).btnTopUpC),
                              ),
                            ),
                            const SizedBox(height: 10.0),
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
                                        Literals.of(context).or,
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: HexColor("#DBDBDB")),
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
                            const SizedBox(height: 10.0),
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
                                  // Lógica del botón "Hacer recarga"
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                child: Text(
                                  Literals.of(context).btnTopUp,
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountrySelectionPage extends StatefulWidget {
  final List<CountryEntity> countries;
  final CountryEntity? selectedCountry;

  const CountrySelectionPage({
    super.key,
    required this.countries,
    required this.selectedCountry,
  });

  @override
  _CountrySelectionPageState createState() => _CountrySelectionPageState();
}

class _CountrySelectionPageState extends State<CountrySelectionPage> {
  late List<CountryEntity> filteredCountries;
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
