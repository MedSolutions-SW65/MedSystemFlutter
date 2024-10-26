import 'package:flutter/material.dart';
import 'package:medsystem_app/appointment_scheduling_screen.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E3F6E),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text(
            'Appointment Search',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'My next appointments',
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 351,
            height: 224,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: const Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: Card(
                color: Color(0xFFEDF2FA),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.calendar_today,
                        size: 65,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 70.0),
                        child: Text('You dont have appointments booked')),
                    Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Schedule a Medical Appointment or Service with us',
                          textAlign: TextAlign.end,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 12.0, left: 100.0, right: 100.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AppointmentSchedulingScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007AFF),
              ),
              child: const Text(
                'Schedule an appointment',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
