import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medsystem_app/presentation/appointments/appointment_scheduling_screen.dart';
import 'package:medsystem_app/presentation/appointments/bloc/appointments_bloc.dart';
import 'package:medsystem_app/presentation/appointments/bloc/appointments_event.dart';
import 'package:medsystem_app/presentation/appointments/bloc/appointments_state.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  void initState() {
    context.read<AppointmentsBloc>().add(GetAppointments());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E3F6E),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(
                top: 16.0), // Espacio adicional en la parte superior
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0), // Espacio alrededor del título
                  child: Text(
                    'Appointment Search',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0), // Espacio alrededor del subtítulo
                  child: Text(
                    'My next appointments',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 50, right: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<AppointmentsBloc, AppointmentsState>(
                  builder: (context, state) {
                    if (state is AppointmentsLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is AppointmentsLoadedState) {
                      if (state.appointments.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 40),
                          child: Card(
                            color: Color(0xFFEDF2FA),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 30, 1, 3),
                                  child: Icon(
                                    Icons.calendar_today,
                                    size: 65,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 70.0),
                                  child: Text(
                                      'You don\'t have appointments booked'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0,
                                      left: 15,
                                      right: 15,
                                      bottom: 10),
                                  child: Text(
                                    'Schedule a Medical Appointment or Service with us',
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.appointments.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: const Color(0xFFEDF2FA),
                              child: Column(
                                children: [
                                  Text(state.appointments[index].doctorId
                                      .toString()),
                                  Text(state.appointments[index].patientId
                                      .toString()),
                                  Text(state.appointments[index].date),
                                  Text(state.appointments[index].reason),
                                  Text(state.appointments[index].specialty),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Text(
                        'Failed to load appointments',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 220, top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AppointmentSchedulingScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF007AFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Schedule an appointment',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
