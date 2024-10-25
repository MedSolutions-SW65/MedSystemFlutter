import 'package:flutter/material.dart';
import 'package:medsystem_app/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medsystem_app/presentation/bloc/treatments_bloc.dart';
import 'package:medsystem_app/presentation/treatments/treatments_page.dart';
import 'package:medsystem_app/loging_page.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medsystem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
