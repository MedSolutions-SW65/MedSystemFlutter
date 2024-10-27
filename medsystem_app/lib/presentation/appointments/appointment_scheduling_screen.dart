import 'package:flutter/material.dart';
import 'package:medsystem_app/presentation/appointments/day_of_the_appointment_screen.dart';

class AppointmentSchedulingScreen extends StatefulWidget {
  const AppointmentSchedulingScreen({super.key});

  @override
  State<AppointmentSchedulingScreen> createState() => _AppointmentSchedulingScreenState();
}

class _AppointmentSchedulingScreenState extends State<AppointmentSchedulingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E3F6E),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Schedule your appointment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6.0, top: 10.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white, // Color del icono
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0, bottom: 150),
            child: Center(
              child: Container(
                width: 350, 
                height: 500, 
                child: const Card(
                  color: Color(0xFFEDF2FA),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'COMPLETE THE DATA',
                          style: TextStyle(
                              fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Who is the appointment for?',
                          style: TextStyle(
                              fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0,right: 100.0, bottom: 20),
                        child: TextField(
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Which is the reason?',
                          style: TextStyle(
                              fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0,right: 100.0, bottom: 20),
                        child: TextField(),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'What speciality?',
                          style: TextStyle(
                              fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0,right: 100.0, bottom: 20),
                        child: TextField(),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Do you have a favorite doctor?',
                          style: TextStyle(
                              fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0,right: 100.0, bottom: 20),
                        child: TextField(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 90.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => 
                        const DayOfAppointmentScreen(),
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
                'Process',
                style: TextStyle(color: Colors.black),
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}