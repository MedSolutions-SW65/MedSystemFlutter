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
    RemoveTreatmentsPage(),
    HistoryTreatmentsPage(),
    AddTreatmentsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Treatments for Patients',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(46, 63, 110, 1),
      ),
      backgroundColor: const Color.fromRGBO(46, 63, 110, 1),
      body: _selectedIndex == -1
          ? const CurrentTreatmentsScreen()
          : _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(200, 203, 207, 219),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
                color: Colors.black,
                activeColor: Colors.black,
                tabBackgroundColor: _selectedIndex != -1
                    ? const Color.fromARGB(200, 96, 196, 209)
                    : Colors.transparent,
                gap: 8,
                padding: const EdgeInsets.all(16),
                duration: const Duration(milliseconds: 900),
                tabs: const [
                  GButton(icon: Icons.delete, text: 'Delete'),
                  GButton(icon: Icons.history, text: 'History'),
                  GButton(icon: Icons.add, text: 'Add'),
                ],
                selectedIndex: _selectedIndex == -1 ? 0 : _selectedIndex,
                onTabChange: _onItemTapped),
          ),
        ),
      ),
    );
  }
}
