// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:im_stepper/stepper.dart';
import 'package:mitopup/domain/entities/entities.dart';
import 'package:mitopup/generated/l10n.dart';

import '../../../config/config.dart';
import '../contacts/contactos.dart';
import '../screens.dart';

// Todo: Contactos CardData=PromoData

class HomeDash extends StatefulWidget {
  static const String name = 'home_dash';
  final Function(int) changePage;

  const HomeDash({super.key, required this.changePage});

  @override
  _HomeDashState createState() => _HomeDashState();
}

class _HomeDashState extends State<HomeDash> {
  List<ContactEntity> _contactos = [];
  bool _isLoadingUserData = true;
  bool _isLoadingContactos = true;
  bool _isLoadingPromos = true;

  String _userName = '';
  String _phoneNumber = '';
  String _email = '';
  String userId = "4";
  List<PromosEntity> promos = [];
  int activeStep = 0;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await _fetchUserData(userId);
    await _fetchContactos(userId);
    await _fetchPromos(userId);
    setState(() {
      _isLoadingUserData = false;
      _isLoadingContactos = false;
      _isLoadingPromos = false;
    });
  }

  Future<void> _fetchUserData(String userId) async {
    setState(() {
      _isLoadingUserData = true;
    });
    try {
      final url =
          Uri.parse('http://5.78.79.129:8080/app.getUserName?userId=$userId');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _userName = data[0]['nombre']?.toString() ?? '';
          _phoneNumber = data[0]['telefono']?.toString() ?? '';
          _email = data[0]['email']?.toString() ?? '';
        });
      } else {
        throw Exception(
            'Error al obtener los datos del usuario del webservice');
      }
    } catch (e) {
      // Manejo de errores
    }
    setState(() {
      _isLoadingUserData = false;
    });
  }

  Future<void> _fetchContactos(String idUsuario) async {
    setState(() {
      _isLoadingContactos = true;
    });
    try {
      final url = Uri.parse(
          'http://5.161.187.55:8080/app.getContactos?idUsuario=$idUsuario');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<ContactEntity> contactos = [];
        for (var item in data) {
          final telefono = item['telefono']?.toString() ?? '';
          final idContacto = item['idContacto']?.toString() ?? '';
          var color = item['color']?.toString() ?? '';
          final nombreContacto = item['nombreContacto']?.toString() ?? '';

          try {
            // Intenta convertir el valor de color a un número hexadecimal
            HexColor(color);
          } catch (e) {
            print('Error en la conversión de color: $color');
            // Asigna un color predeterminado en caso de error
            const defaultColor = '#B0E0E6';
            color = defaultColor;
          }
          contactos.add(ContactEntity(
            idContact: int.tryParse(idContacto) ?? 0,
            nameContact: nombreContacto,
            phoneContact: telefono,
            email: '',
            phone: '',
            color: color,
            userId: 0,
            userName: '',
          ));
        }
        setState(() {
          _contactos = contactos;
          _isLoadingContactos = false;
        });
      } else {
        throw Exception('Error al obtener los contactos del webservice');
      }
    } catch (e) {
      // Manejo de errores
      setState(() {
        _isLoadingContactos = false;
      });
    }
  }

  Future<void> _fetchPromos(String userId) async {
    final url =
        Uri.parse('http://5.78.79.129:8080/app.getPromos?idUser=$userId');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<PromosEntity> promosData = [];
        for (var promo in data) {
          final bgColor = promo['bgColor']?.toString() ?? '';
          final imageUrl = promo['icon']?.toString() ?? '';
          final cantidad = promo['cantidad']?.toString() ?? '';
          final descripcion = promo['descripcion']?.toString() ?? '';
          final validez = promo['validez']?.toString() ?? '';
          final idPromo = promo['idPromo']?.toString() ?? '';

          promosData.add(PromosEntity(
            bgColor: bgColor,
            imageUrl: imageUrl,
            amount: cantidad,
            description: descripcion,
            validity: validez,
            idPromo: idPromo,
          ));
        }
        setState(() {
          promos = promosData;
        });
      } else {
        throw Exception('Error al obtener los datos del webservice');
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Widget _buildCardWidget(PromosEntity cardData) {
    return GestureDetector(
      onTap: () {
        // Lógica para manejar el tap en la tarjeta de promoción (opcional)
      },
      child: Container(
        decoration: BoxDecoration(
          color: HexColor(cardData.bgColor),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
        child: Center(
          child: Row(
            children: [
              // Primera Columna (Imagen)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    cardData.imageUrl, // Mostrar la imagen desde la URL
                    width: 64,
                    height: 64,
                  ),
                ],
              ),

              // Segunda Columna (Cantidad, Descripción y Validez)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          cardData.amount,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            letterSpacing: 0,
                            color: HexColor("#34405F"),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Agregamos un espacio entre la cantidad y la descripción
                        Expanded(
                          child: Text(
                            cardData.description,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                              letterSpacing: 0,
                              color: HexColor("#34405F"),
                            ),
                            maxLines: 2,
                            // Establecemos el máximo de líneas para evitar el desbordamiento
                            overflow: TextOverflow
                                .ellipsis, // Agregamos la elipsis (...) para mostrar que hay más texto
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Agregamos un espacio entre la descripción y la validez
                    Text(
                      cardData.validity,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        letterSpacing: 0,
                        color: HexColor("#34405F"),
                      ),
                    ),
                  ],
                ),
              ),
              // Tercera Columna (Icono de Chevron)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.chevron_right,
                    color: HexColor("#34405F"),
                    size: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingUserData || _isLoadingContactos || _isLoadingPromos) {
      return const Scaffold(
        body: Center(
          child: Loader(),
        ),
      );
    } else {
      return Scaffold(
        appBar: DashAppBar(
          userName: _userName,
          notificationOnPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Notificaciones()),
            );
          },
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    kBottomNavigationBarHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Las cards para promociones
                    if (promos.isNotEmpty)
                      SizedBox(
                        height: 190,
                        child: PageView.builder(
                          itemCount: promos.length,
                          controller: PageController(
                            viewportFraction: 0.95,
                            initialPage: 0,
                          ),
                          onPageChanged: (index) {
                            setState(() {
                              activeStep = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _buildCardWidget(promos[index]),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    else
                      const Center(
                        child: Text(
                          "No hay promociones activas",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    // DotStepper para las promociones
                    if (promos.length > 2)
                      Center(
                        child: DotStepper(
                          dotCount: promos.length,
                          dotRadius: 8,
                          activeStep: activeStep,
                          shape: Shape.circle,
                          spacing: 10,
                          indicator: Indicator.worm,
                          fixedDotDecoration: FixedDotDecoration(
                            color: HexColor("#DBDBDB"),
                          ),
                          onDotTapped: (tappedDotIndex) {
                            setState(() {
                              activeStep = tappedDotIndex;
                            });
                          },
                          indicatorDecoration: IndicatorDecoration(
                            color: HexColor("#005CEE"),
                          ),
                          lineConnectorDecoration:
                              const LineConnectorDecoration(
                            color: Colors.red,
                            strokeWidth: 2,
                          ),
                        ),
                      ),

                    const SizedBox(height: 20),

                    //LOS contactos
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Literals.of(context).contacts,
                            style: const TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: 1.22,
                              letterSpacing: 0,
                              color: Color(0xFF34405F),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Contactos()),
                              );
                            },
                            child: Text(
                              Literals.of(context).verTodo,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.19,
                                letterSpacing: 0.02,
                                color: HexColor("#0743DF"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ListView para mostrar los círculos y el botón
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0), // Añade un espaciado horizontal
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var index = 0;
                              index < _contactos.length && index < 4;
                              index++)
                            Expanded(
                              child: _buildContactoWidget(_contactos[index]),
                            ),
                          const SizedBox(width: 5),
                          Container(
                            width: MediaQuery.of(context).size.width *
                                0.2, // Ancho del 20% de la pantalla
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // Alinea el botón "Agregar" en el inicio
                              children: [
                                _buildAddContactWidget(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_contactos.isEmpty && activeStep == 0)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "No se encontraron contactos",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: HexColor("#888888"),
                          ),
                        ),
                      ),

                    const SizedBox(height: 20),

                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 20.0),
                      child: BlueButton(
                        onPressed: () {},
                        buttonText: capitalize(Literals.of(context).btnTopUp),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Literals.of(context).recentRecharges,
                            style: const TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: 1.22,
                              letterSpacing: 0,
                              color: Color(0xFF34405F),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              widget.changePage(
                                  1); // Llamar al método changePage pasando el índice 1 para "Recargas"
                            },
                            child: Text(
                              Literals.of(context).verTodo,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.19,
                                letterSpacing: 0.02,
                                color: HexColor("#0743DF"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Centra verticalmente el Row completo
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // Centra verticalmente los elementos en esta Row
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // Centra verticalmente los elementos en esta Column
                                    children: [
                                      Center(
                                        // Envuelve el CircleAvatar con un Center
                                        child: CircleAvatar(
                                          backgroundColor: HexColor("#C4C4C4"),
                                          radius: 30,
                                          child: const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // Centra verticalmente los elementos en esta Column
                                    children: [
                                      Text(
                                        "23/02/2023 14:05",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: HexColor("#888888"),
                                          height: 1.5,
                                        ),
                                      ),
                                      Text(
                                        "+52655212841",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          height: 1.5,
                                          color: HexColor("#34405F"),
                                        ),
                                      ),
                                      Text(
                                        "400 MXN de crédito",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          height: 1.5,
                                          color: HexColor("#888888"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(0.0),
                                child: IconButton(
                                  onPressed: () {
                                    // Llamar al método changePage pasando el índice 1 para "Recargas"
                                  },
                                  icon: const Icon(Icons.chevron_right),
                                  iconSize: 40,
                                  color: HexColor("#34405F"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Centra verticalmente el Row completo
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // Centra verticalmente los elementos en esta Row
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // Centra verticalmente los elementos en esta Column
                                    children: [
                                      Center(
                                        // Envuelve el CircleAvatar con un Center
                                        child: CircleAvatar(
                                          backgroundColor: HexColor("#C4C4C4"),
                                          radius: 30,
                                          child: const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // Centra verticalmente los elementos en esta Column
                                    children: [
                                      Text(
                                        "23/02/2023 14:05",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: HexColor("#888888"),
                                          height: 1.5,
                                        ),
                                      ),
                                      Text(
                                        "+52655212841",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          height: 1.5,
                                          color: HexColor("#34405F"),
                                        ),
                                      ),
                                      Text(
                                        "400 MXN de crédito",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          height: 1.5,
                                          color: HexColor("#888888"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(0.0),
                                child: IconButton(
                                  onPressed: () {
                                    // Llamar al método changePage pasando el índice 1 para "Recargas"
                                  },
                                  icon: const Icon(Icons.chevron_right),
                                  iconSize: 40,
                                  color: HexColor("#34405F"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _buildContactoWidget(ContactEntity contacto) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.2, // Ancho del 20% de la pantalla
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: HexColor(contacto.color),
            radius: 25,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                contacto.userName.substring(0, 1).toUpperCase(),
                style: const TextStyle(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              contacto.userName,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddContactWidget() {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.2, // Ancho del 20% de la pantalla
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: HexColor("#0743DF"),
            radius: 25,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              Literals.of(context).addNew,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  String getRandomColor() {
    final random = Random();
    final color = random.nextInt(0xFFFFFF);
    return '#${color.toRadixString(16).padLeft(6, '0')}';
  }
}
