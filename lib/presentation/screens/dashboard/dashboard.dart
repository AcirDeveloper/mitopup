// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../config/config.dart';
import '../screens.dart';

// Todo: Contactos

class Dashboard extends StatefulWidget {
  final String userId;

  const Dashboard({super.key, required this.userId});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  String _userName = '';

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _fetchUserData(String userId) async {
    final url =
        Uri.parse('http://5.161.187.55:8080/app.getUserName?userId=$userId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Respuesta del servidor para _fetchUserData: $data");
      setState(() {
        _userName = data[0]['nombre']?.toString() ?? '';
      });
    } else {
      throw Exception('Error al obtener los datos del usuario del webservice');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchUserData(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Center(
            child: HomeDash(changePage: _changePage),
          ),
          Center(
            child: RecargasDash(userId: widget.userId),
          ),
          const Center(
            child: PromosPage(),
          ),
          const Center(
            child: PerfilDash(),
          ),
        ],
      ),
      bottomNavigationBar: DashBottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarItemTapped,
      ),
    );
  }

  void _onBottomNavBarItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

void main() {
  String userId = '4';
  runApp(MaterialApp(
    home: Dashboard(userId: userId),
  ));
}