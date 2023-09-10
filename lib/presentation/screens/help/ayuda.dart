// ignore_for_file: library_private_types_in_public_api, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:mitopup/config/theme/theme.dart';
import 'package:mitopup/generated/l10n.dart';
import '../screens.dart';

class CentroAyudaPage extends StatefulWidget {
  const CentroAyudaPage({super.key});

  @override
  _CentroAyudaPageState createState() => _CentroAyudaPageState();
}

class _CentroAyudaPageState extends State<CentroAyudaPage> {
  List<Pregunta> _preguntas = [];
  bool _isLoading = true;
  int _expandedIndex = -1; // Índice del elemento actualmente expandido

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final idioma = Localizations.localeOf(context).languageCode;
      _fetchPreguntas(idioma);
    });
  }

  Future<void> _fetchPreguntas(String idioma) async {
    final url =
        Uri.parse('http://5.161.187.55:8080/app.getFaqs?idioma=$idioma');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Pregunta> preguntas = [];
      for (var item in data) {
        preguntas.add(Pregunta(
          pregunta: item['pregunta'],
          respuesta: item['respuesta'],
          isExpanded:
              false, // Agrega el estado inicial de expansión para cada elemento
        ));
      }
      setState(() {
        _preguntas = preguntas;
        _isLoading = false;
      });
    } else {
      throw Exception('Error al obtener las preguntas del webservice');
    }
  }

  void _handleExpand(int index, bool isExpanded) {
    setState(() {
      if (isExpanded) {
        _expandedIndex =
            -1; // Si el elemento está expandido, se cierra al hacer clic nuevamente
      } else {
        _expandedIndex = index; // Si el elemento no está expandido, se expande
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBarAyuda(
        title: Literals.of(context).helpTitle,
        leadingOnPressed: () {
          // Todo: implementa la lógica para cancelar y volver a la página anterior
        },
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.25),
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _preguntas.length,
                  itemBuilder: (context, index) {
                    final pregunta = _preguntas[index];
                    return ExpansionPanelList(
                      elevation: 0,
                      // Quita la sombra del ExpansionPanelList
                      expandedHeaderPadding: EdgeInsets.zero,
                      // Quita el espacio entre el header expandido y el cuerpo
                      expansionCallback: (panelIndex, isExpanded) =>
                          _handleExpand(index, isExpanded),
                      children: [
                        ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              title: Text(pregunta.pregunta),
                            );
                          },

                          body: Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                              top: 0,
                              right: 25,
                              bottom: 20,
                            ),
                            child: Text(
                              pregunta.respuesta,
                              style: TextStyle(
                                color: HexColor("#888888"),
                                fontSize: 16,
                                height: 1.8,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          isExpanded: index ==
                              _expandedIndex, // Define el estado inicial de expansión
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
      bottomNavigationBar: IntrinsicHeight(
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.2, color: Colors.black12),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.fromLTRB(0.8, 25, 0.8, 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Literals.of(context).plusHelp),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AyudaForm()),
                  );
                },
                child: Text(Literals.of(context).contactUs),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pregunta {
  final String pregunta;
  final String respuesta;

  Pregunta({
    required this.pregunta,
    required this.respuesta,
    required bool isExpanded,
  });
}
