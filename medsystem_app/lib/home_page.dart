import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medsystem_app/presentation/appointments/appointment_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 8, 91, 214),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(104, 103, 171, 248),
              gap: 8,
              padding: const EdgeInsets.all(16),
              duration: const Duration(milliseconds: 900),
              onTabChange: (index) {
                debugPrint('$index');
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AppointmentPage()),
                  );
                }
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(icon: Icons.alarm, text: 'Appointments'),
                GButton(icon: Icons.align_vertical_bottom, text: 'Treatment'),
                GButton(icon: Icons.chat, text: 'Chat'),
              ],
            ),
          ),
        ),
      ),
      //body: const SafeArea(child: HomePage()),
    );
  }
}