import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _photoPath = '';
  String? _filePath = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            controller: _addressController,
            decoration: const InputDecoration(labelText: 'Address'),
          ),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Phone'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _selectPhoto();
            },
            child: const Text('Select photo'),
          ),
          _photoPath != null ? Text(_photoPath!) : Container(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _selectDocument();
            },
            child: const Text('Select document'),
          ),
          _filePath != null ? Text(_filePath!) : Container(),
          const SizedBox(height: 16),
          _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Send'),
                ),
        ],
      ),
    );
  }

  void _selectPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _photoPath = result.files.single.path!;
      });
    } else {
      setState(() {
        _photoPath = null;
      });
    }
  }

  void _selectDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _filePath = result.files.single.path!;
      });
    } else {
      setState(() {
        _filePath = null;
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
        request.fields['nombre'] = _nameController.text;
        request.fields['direccion'] = _addressController.text;
        request.fields['telefono'] = _phoneController.text;

        if (_photoPath != null && _photoPath!.isNotEmpty) {
          final fotoFile = await http.MultipartFile.fromPath(
              'foto', _photoPath!,
              contentType: MediaType('image', 'jpeg'));
          request.files.add(fotoFile);
        }

        if (_filePath != null && _filePath!.isNotEmpty) {
          final documentoFile = await http.MultipartFile.fromPath(
              'documento', _filePath!,
              contentType: MediaType('application', 'pdf'));
          request.files.add(documentoFile);
        }

        var streamedResponse = await request.send();
        var response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          var responseBody = response.body;
          if (kDebugMode) {
            print(responseBody);
          }

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
