import 'package:flutter/material.dart';
import 'package:medsystem_app/presentation/appointments/reserve_summary_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class DayOfAppointmentScreen extends StatefulWidget {
  const DayOfAppointmentScreen({super.key});

  @override
  DayOfAppointmentScreenState createState() => DayOfAppointmentScreenState();
}

class DayOfAppointmentScreenState extends State<DayOfAppointmentScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E3F6E),
      body: Stack(children: [
        const Padding(
          padding: EdgeInsets.only(top: 50.0),
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
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Card(
                color: const Color(0xFFEDF2FA),
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text('Select your turn',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: _focusedDay,
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      if (_selectedDay != null)
                        Text(
                          'Fecha seleccionada: ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 270.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReserveSummaryScreen(),
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
                'Next',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
