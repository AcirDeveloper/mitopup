// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mitopup/presentation/screens/dashboard/home_dashboard.dart';
import 'dart:convert';

import '../../../config/config.dart';
import '../../../data/services/user_services.dart';
import '../recharges/recharges_dashboard.dart';
import '../screens.dart';

// Todo: Contactos

class Dashboard extends StatefulWidget {
  static const String name = 'dashboard-screen';

  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  String _userName = '';

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> fetchUserData(String userId) async {
    try {
      final userData = await UserServices.fetchUserData(userId);
      setState(() {
        _userName = userData['userName'] ?? '';
      });
    } catch (e) {
      print('Error fetching user data: $e');
      // Maneja el error aquí
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _fetchUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          Center(
            child: HomeDashboard(),
          ),
          Center(
            child: RechargesDashboard(
              userId: '43',
            ),
          ),
          Center(
            child: PromosScreen(),
          ),
          Center(
            child: ProfileScreen(),
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

// void main() {
//   String userId = '43';
//   runApp(MaterialApp(
//     home: Dashboard(userId: userId),
//   ));
// }
