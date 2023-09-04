import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:mitopup/generated/l10n.dart';

class Recarga {
  final String fecha;
  final String contacto;
  final String cantidad;

  Recarga({required this.fecha, required this.contacto, required this.cantidad});
}

class RecargasDash extends StatefulWidget {
  final String userId;

  RecargasDash({required this.userId});

  @override
  _RecargasDashState createState() => _RecargasDashState();
}

class _RecargasDashState extends State<RecargasDash> {
  List<Recarga> recargas = [];
  String ordenSeleccionado = 'Más recientes';
  List<String> monthTitles = []; // Lista para almacenar títulos de mes

  @override
  void initState() {
    super.initState();
    _fetchRecargas().then((_) {
      _ordenarRecargas(); // Ordenar los datos después de cargar
    });
  }


  Future<void> _fetchRecargas() async {
    final url = Uri.parse('http://5.161.187.55:8080/app.getHistorialRecargas?idUser=${widget.userId}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      print(responseData);
      final List<Recarga> fetchedRecargas = responseData.map((data) {
        return Recarga(
          fecha: data['fecha'],
          contacto: data['contacto'],
          cantidad: data['cantidad'],
        );
      }).toList();

      setState(() {
        recargas = fetchedRecargas;
      });
    } else {
      print('Error al cargar las recargas');
    }
  }

  void _ordenarRecargas() {
    setState(() {
      List<Recarga> filteredRecargas = [...recargas]; // Crear una copia de la lista original
      if (ordenSeleccionado == 'Más recientes') {
        filteredRecargas.sort((a, b) {
          int dateComparison = b.fecha.compareTo(a.fecha);
          if (dateComparison == 0) {
            return b.fecha.compareTo(a.fecha);
          }
          return dateComparison;
        });
      } else {
        filteredRecargas.sort((a, b) => a.fecha.compareTo(b.fecha));
      }
      recargas = filteredRecargas; // Actualizar la lista recargas con la lista filtrada
      monthTitles.clear(); // Limpiar la lista de títulos de mes
      for (var recarga in recargas) {
        String newMonthTitle = getMonthTitle(recarga.fecha);
        if (!monthTitles.contains(newMonthTitle)) {
          monthTitles.add(newMonthTitle);
        }
      }
    });
  }

  void _mostrarFiltroBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: Text(
                'Título del Filtro',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Color(0xFFDBDBDB),
            ),
            _buildFiltroBottomSheetItem('Más recientes', Icons.check_circle_outline),
            _buildFiltroBottomSheetItem('Más antiguos', Icons.check_circle_outline),
          ],
        );
      },
    );
  }


  Widget _buildFiltroBottomSheetItem(String text, IconData icon) {
    return InkWell(
      onTap: () {
        setState(() {
          ordenSeleccionado = text;
        });
        _ordenarRecargas();
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 12),
                Text(
                  text,
                  style: TextStyle(
                    color: HexColor("#34405F"),
                    fontSize: 16,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.16,
                    wordSpacing: 0,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: HexColor('#dbdbdb'), width: 1)),
              ),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ordenSeleccionado == text ? Colors.blue : Colors.white,
                  border: Border.all(color: HexColor('#dbdbdb'), width: 1),
                ),
                child: ordenSeleccionado == text
                    ? Icon(Icons.check, color: Colors.white, size: 16)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = kToolbarHeight;
    double bottomNavBarHeight = kBottomNavigationBarHeight;
    double availableBodyHeight = MediaQuery.of(context).size.height - appBarHeight - bottomNavBarHeight;
    String currentMonthTitle = "";

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        title: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Literals.of(context).bottomBar2,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            InkWell(
              onTap: _mostrarFiltroBottomSheet,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          ordenSeleccionado,
                          style: TextStyle(
                            color: HexColor("#34405F"),
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.16,
                            wordSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Icon(Icons.expand_more, color: HexColor("#34405F"), size: 24),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: availableBodyHeight,
          ),
          child: Container(
            color: Colors.white,
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recargas.length,
              itemBuilder: (context, index) {
                Recarga recarga = recargas[index];
                String monthTitle = getMonthTitle(recarga.fecha);
                bool showSeparator = currentMonthTitle != monthTitle;
                currentMonthTitle = monthTitle;
                return Column(
                  children: [
                    if (showSeparator)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 30, 35, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            capitalize(monthTitle),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: HexColor("#34405F"),
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: CircleAvatar(
                                          backgroundColor: HexColor("#C4C4C4"),
                                          radius: 30,
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        recarga.fecha,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: HexColor("#888888"),
                                          height: 1.5,
                                        ),
                                      ),
                                      Text(
                                        recarga.contacto,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          height: 1.5,
                                          color: HexColor("#34405F"),
                                        ),
                                      ),
                                      Text(
                                        recarga.cantidad,
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
                                padding: EdgeInsets.all(0.0),
                                child: IconButton(
                                  onPressed: () {
                                    // Llamar al método changePage pasando el índice 1 para "Recargas"
                                  },
                                  icon: Icon(Icons.chevron_right),
                                  iconSize: 40,
                                  color: HexColor("#34405F"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  String getMonthTitle(String fecha) {
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(fecha);
    String monthTitle = DateFormat("MMMM 'de' y", 'es_ES').format(dateTime);
    return monthTitle;
  }

  String capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}