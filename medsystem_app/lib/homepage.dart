import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medsystem_app/chat_list_page.dart';
import 'package:medsystem_app/presentation/appointments/appointment_page.dart';
import 'package:medsystem_app/presentation/profile_page.dart';
import 'package:medsystem_app/presentation/treatments/treatments_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AppointmentPage(),
    const Placeholder(), // Aquí añadiremos el botón para TreatmentsScreen
    ChatListPage(),
    const UserProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 1
          ? Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navegamos a TreatmentsScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TreatmentsScreen(),
                    ),
                  );
                },
                child: const Text("Mira tus tratamientos"),
              ),
            )
          : _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 25, 38, 56),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              selectedIndex: _selectedIndex,
              color: const Color.fromARGB(255, 255, 255, 255),
              activeColor: const Color.fromARGB(255, 255, 255, 255),
              tabBackgroundColor: const Color.fromARGB(104, 51, 77, 104),
              gap: 8,
              padding: const EdgeInsets.all(16),
              duration: const Duration(milliseconds: 900),
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: const [
                GButton(icon: Icons.alarm, text: 'Appointments'),
                GButton(icon: Icons.align_vertical_bottom, text: 'Treatments'),
                GButton(icon: Icons.chat, text: 'Chat'),
                GButton(icon: Icons.person, text: 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
