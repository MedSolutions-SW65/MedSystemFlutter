import 'package:flutter/material.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';
//import 'package:medsystem_app/presentation/treatments/add_treatments_page.dart';
import 'package:medsystem_app/presentation/treatments/current_treatments_page.dart';

class TreatmentsScreen extends StatefulWidget {
  const TreatmentsScreen({super.key});

  @override
  State<TreatmentsScreen> createState() => _TreatmentsScreenState();
}

class _TreatmentsScreenState extends State<TreatmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Treatments for Patients',
            style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 0, 0, 0)),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: const CurrentTreatmentsScreen());
  }
}
