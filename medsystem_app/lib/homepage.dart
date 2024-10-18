import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
              onTabChange: (index) {
                debugPrint('$index');
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
    );
  }
}
