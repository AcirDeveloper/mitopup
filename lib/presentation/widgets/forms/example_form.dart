// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  String? _fotoPath = '';
  String? _documentoPath = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nombreController,
            decoration: const InputDecoration(labelText: 'Nombre'),
          ),
          TextFormField(
            controller: _direccionController,
            decoration: const InputDecoration(labelText: 'Dirección'),
          ),
          TextFormField(
            controller: _telefonoController,
            decoration: const InputDecoration(labelText: 'Teléfono'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _selectFoto();
            },
            child: const Text('Seleccionar foto'),
          ),
          _fotoPath != null ? Text(_fotoPath!) : Container(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _selectDocumento();
            },
            child: const Text('Seleccionar documento'),
          ),
          _documentoPath != null ? Text(_documentoPath!) : Container(),
          const SizedBox(height: 16),
          _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Enviar'),
                ),
        ],
      ),
    );
  }

  void _selectFoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _fotoPath = result.files.single.path!;
      });
    } else {
      setState(() {
        _fotoPath = null;
      });
    }
  }

  void _selectDocumento() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _documentoPath = result.files.single.path!;
      });
    } else {
      setState(() {
        _documentoPath = null;
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final request = http.MultipartRequest(
            'POST', Uri.parse('http://95.216.212.17/flutter.saveContacto'));
        request.fields['nombre'] = _nombreController.text;
        request.fields['direccion'] = _direccionController.text;
        request.fields['telefono'] = _telefonoController.text;

        if (_fotoPath != null && _fotoPath!.isNotEmpty) {
          final fotoFile = await http.MultipartFile.fromPath('foto', _fotoPath!,
              contentType: MediaType('image', 'jpeg'));
          request.files.add(fotoFile);
        }

        if (_documentoPath != null && _documentoPath!.isNotEmpty) {
          final documentoFile = await http.MultipartFile.fromPath(
              'documento', _documentoPath!,
              contentType: MediaType('application', 'pdf'));
          request.files.add(documentoFile);
        }

        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          var responseBody = response.body;
          print(responseBody);

          if (responseBody == 'OK') {
            _showSuccessAlert();
          } else {
            _showErrorAlert();
          }
        } else {
          _showErrorAlert();
        }
      } catch (error) {
        _showErrorAlert();
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showSuccessAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green)),
          content: const Text('OK'),
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

  void _showErrorAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(
            Icons.close,
            color: Colors.red,
            size: 48.0,
          ),
          content: const Text('Error en el envío'),
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
