import 'package:flutter/material.dart';
import 'package:mitopup/config/theme/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../screens/home_dash.dart';
import '../screens/profile_dash.dart';
import '../screens/promos.dart';
import '../screens/refills_dash.dart';

class Contacto {
  final int idContacto;
  final String nombre;
  final String telefono;
  final String email;
  final String phoneNumber;
  final int userId;
  final String name;

  Contacto({
    required this.idContacto,
    required this.nombre,
    required this.telefono,
    required this.email,
    required this.phoneNumber,
    required this.userId,
    required this.name,
  });
}

class Dashboard extends StatefulWidget {
  final String userId;

  Dashboard({required this.userId});

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
    final url = Uri.parse(
        'http://5.161.187.55:8080/app.getUserName?userId=$userId');
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
    WidgetsBinding.instance?.addPostFrameCallback((_) {
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
          Center(
            child: PromosPage(),
          ),
          Center(
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
