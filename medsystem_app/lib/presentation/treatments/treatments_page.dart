import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medsystem_app/presentation/treatments/add_treatments_page.dart';
import 'package:medsystem_app/presentation/treatments/current_treatments_page.dart';
import 'package:medsystem_app/presentation/treatments/history_treatments_page.dart';
import 'package:medsystem_app/presentation/treatments/remove_treatments_page.dart';

class TreatmentsScreen extends StatefulWidget {
  const TreatmentsScreen({super.key});

  @override
  State<TreatmentsScreen> createState() => _TreatmentsScreenState();
}

class _TreatmentsScreenState extends State<TreatmentsScreen> {
  int _selectedIndex = -1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    HistoryTreatmentsPage(),
    AddTreatmentsScreen(),
    RemoveTreatmentsPage(),
  ];

  String _getAppBarTitle() {
    if (_selectedIndex == 0) return 'Current Treatments';
    if (_selectedIndex == 1) return 'Add Treatments';
    if (_selectedIndex == 2) return 'Remove Treatments';
    return 'Current Treatments';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getAppBarTitle(),
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 25, 38, 56),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresa al Homepage
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          _selectedIndex == -1
              ? const CurrentTreatmentsScreen()
              : _pages[_selectedIndex],
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30),
          ),
          child: GNav(
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromARGB(255, 96, 196, 209),
            gap: 8,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 300),
            tabs: const [
              GButton(icon: Icons.history, text: 'History'),
              GButton(icon: Icons.add, text: 'Add'),
              GButton(icon: Icons.delete, text: 'Delete'),
            ],
            selectedIndex: _selectedIndex == -1 ? 0 : _selectedIndex,
            onTabChange: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
