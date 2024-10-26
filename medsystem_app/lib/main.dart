import 'package:flutter/material.dart';
import 'package:medsystem_app/appointment_page.dart';
import 'package:medsystem_app/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, 
      //home: HomePage(),
      home: AppointmentPage()
    );
  }
}
