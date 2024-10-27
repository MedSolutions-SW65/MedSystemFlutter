import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medsystem_app/presentation/appointments/appointment_page.dart';
import 'package:medsystem_app/presentation/appointments/bloc/appointments_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentsBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: AppointmentPage()
      ),
    );
  }
}
