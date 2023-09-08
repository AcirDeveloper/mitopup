// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mitopup/generated/l10n.dart';
import 'package:mitopup/main.dart';

import '../../../config/config.dart';
import '../screens.dart';

class AyudaForm extends StatefulWidget {
  const AyudaForm({Key? key}) : super(key: key);

  @override
  _AyudaFormState createState() => _AyudaFormState();
}

class _AyudaFormState extends State<AyudaForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mensajeController = TextEditingController();
  String? _archivoPath;
  bool _isLoading = false;
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _nombreController.addListener(_validateForm);
    _emailController.addListener(_validateForm);
    _mensajeController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _mensajeController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isButtonDisabled = _nombreController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _mensajeController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LightAppBarAyuda(
        title: Literals.of(context).formHelp,
        leadingOnPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CentroAyudaPage()),
          );
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Literals.of(context).fromTitle,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Literals.of(context).formName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nombreController,
                    decoration: InputDecoration(
                      hintText: Literals.of(context).formNamePlaceholder,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: HexColor("#D2D5DA"))),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: HexColor("#0743DF")),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Literals.of(context).formNameError;
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Literals.of(context).formEmail,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: Literals.of(context).formEmailPlaceholder,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: HexColor("#D2D5DA"))),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide:
                            BorderSide(width: 2, color: HexColor("#0743DF")),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Literals.of(context).formEmailError;
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Literals.of(context).formMessage,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _mensajeController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: Literals.of(context).formMessagePlaceholder,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: HexColor("#D2D5DA"))),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide:
                            BorderSide(width: 2, color: HexColor("#0743DF")),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Literals.of(context).formMessageError;
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _selectArchivo,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: HexColor("#0743DF"),
                        width: 1,
                      ),
                    ), // Fondo blanco
                  ),
                  child: Text(
                    Literals.of(context).formAttach,
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 19 / 16,
                      letterSpacing: 0.0017,
                      color: HexColor("#0743DF"), // Color de texto
                    ),
                    textAlign: TextAlign.center, // Alineación del texto
                  ),
                ),
              ),
              _archivoPath != null ? Text(_archivoPath!) : Container(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              height: 50,
              child: _isButtonDisabled
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: HexColor("#75AFFF"),
                      ),
                      child: InkWell(
                        onTap: null,
                        child: Center(
                          child: Text(
                            Literals.of(context).formSend,
                            style: const TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 19 / 16,
                              letterSpacing: 0.0017,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: _isLoading ? null : _submitForm,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: HexColor("#005CEE"),
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: HexColor("#0743DF"),
                            width: 1,
                          ),
                        ),
                        elevation: 8,
                        shadowColor: HexColor("#75AFFF"),
                      ),
                      child: Text(
                        Literals.of(context).formSend,
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 19 / 16,
                          letterSpacing: 0.0017,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
            const SizedBox(height: 16),
            if (_isLoading) const Loader(),
          ],
        ),
      ),
    );
  }

  void _selectArchivo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _archivoPath = result.files.single.path!;
      });
    } else {
      setState(() {
        _archivoPath = null;
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final request = http.MultipartRequest('POST',
            Uri.parse('http://5.161.187.55:8080/app.guardaFormContacto'));
        request.fields['nombre'] = _nombreController.text;
        request.fields['email'] = _emailController.text;
        request.fields['mensaje'] = _mensajeController.text;

        if (_archivoPath != null && _archivoPath!.isNotEmpty) {
          final file = await http.MultipartFile.fromPath(
              'archivo', _archivoPath!,
              contentType: MediaType('application', 'pdf'));
          request.files.add(file);
        }

        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          _showSuccessAlert();
        } else {
          _showErrorAlert();
        }
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showSuccessAlert() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 15.0),
                child: ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            Literals.of(context).successTitle,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CentroAyudaPage()),
                            (route) => false,
                          );
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 2,
                color: HexColor("#DBDBDB"),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                child: IntrinsicHeight(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Literals.of(context).successLead,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: HexColor("#34405F"),
                            ),
                          ),
                          const SizedBox(height: 30.0),

                          // Contenido adicional del BottomSheet
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: HexColor("#0743DF"),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      Literals.of(context).successButton,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 19 / 16,
                        letterSpacing: 0.0017,
                        color: HexColor("#0743DF"),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        );
      },
    );
  }

  void _showErrorAlert() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error,
                color: Colors.red,
                size: 48.0,
              ),
              const SizedBox(height: 16.0),
              const Text('Error, intenta de nuevo'),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context); // Cerrar el BottomSheet al presionar "Aceptar"
                },
                child: const Text('Aceptar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
