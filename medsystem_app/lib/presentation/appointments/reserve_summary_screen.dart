import 'package:flutter/material.dart';
import 'package:medsystem_app/presentation/appointments/appointment_page.dart';

class ReserveSummaryScreen extends StatefulWidget {
  const ReserveSummaryScreen({super.key});

  @override
  State<ReserveSummaryScreen> createState() => _ReserveSummaryScreenState();
}

class _ReserveSummaryScreenState extends State<ReserveSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E3F6E),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Schedule your appointment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 30.0, bottom: 20, left: 30, right: 30),
                  child: Center(
                    child: Card(
                      color: Color(0xFFEDF2FA),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Reserve Sumary',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(top: 40, left: 10),
                            child: Row(children: [
                              Icon(Icons.man, size: 20),
                              Text(
                                'PATIENT:',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(children: [
                              Icon(Icons.location_on, size: 20),
                              Text(
                                'REASON:',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(children: [
                              Icon(Icons.healing, size: 20),
                              Text(
                                'SPECIALITY:',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(children: [
                              Icon(Icons.medical_services_outlined, size: 20),
                              Text(
                                'DOCTOR:',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(bottom: 40, left: 10),
                            child: Row(children: [
                              Icon(Icons.access_time, size: 20),
                              Text(
                                'TURN:',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Center(
                    child: Text("S/ 42.00",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AppointmentPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5722),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Confirm and pay',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
