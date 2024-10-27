import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medsystem_app/presentation/appointments/appointment_page.dart';
import 'package:medsystem_app/presentation/appointments/bloc/appointments_bloc.dart';

//import 'package:medsystem_app/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medsystem_app/services/auth/auth_gate.dart';
import 'package:medsystem_app/firebase_options.dart';

import 'package:medsystem_app/presentation/bloc/treatments_bloc.dart';
//import 'package:medsystem_app/presentation/treatments/treatments_page.dart';
//import 'package:medsystem_app/loging_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TreatmentsBloc(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: AuthGate()),
    );
  }
}
