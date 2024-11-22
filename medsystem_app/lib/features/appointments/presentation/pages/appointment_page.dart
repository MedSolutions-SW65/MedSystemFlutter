import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medsystem_app/features/appointments/presentation/pages/appointment_scheduling_screen.dart';
import 'package:medsystem_app/features/appointments/presentation/blocs/appointments_bloc.dart';
import 'package:medsystem_app/features/appointments/presentation/blocs/appointments_event.dart';
import 'package:medsystem_app/features/appointments/presentation/blocs/appointments_state.dart';

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
      body: Stack(
        children: [
          // Fondo con imagen
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/fondo.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Column(
            children: [
              // Título centrado
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 8, height: 60,),
                    Text(
                      'Appointments',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BlocBuilder<AppointmentsBloc, AppointmentsState>(
                    builder: (context, state) {
                      if (state is AppointmentsLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is AppointmentsLoadedState) {
                        if (state.appointments.isEmpty) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 65,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'You don\'t have appointments booked',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Schedule a Medical Appointment or Service with us',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: state.appointments.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: const Color.fromARGB(255, 255, 255, 255)
                                  .withOpacity(0.7),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                title: Text(
                                  'Doctor ID: ${state.appointments[index].doctorId}',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Patient ID: ${state.appointments[index].patientId}',
                                      style: const TextStyle(color: Colors.black54),
                                    ),
                                    Text(
                                      'Date: ${state.appointments[index].date}',
                                      style: const TextStyle(color: Colors.black54),
                                    ),
                                    Text(
                                      'Reason: ${state.appointments[index].reason}',
                                      style: const TextStyle(color: Colors.black54),
                                    ),
                                    Text(
                                      'Specialty: ${state.appointments[index].specialty}',
                                      style: const TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                                isThreeLine: true,
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'Failed to load appointments',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AppointmentSchedulingScreen(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 68, 138, 255),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
