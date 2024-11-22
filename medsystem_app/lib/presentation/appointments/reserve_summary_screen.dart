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
      appBar: AppBar(
        title: const Text(
          'Reserve Summary',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF2E3F6E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Card(
                    color: const Color(0xFFEDF2FA),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Summary Details',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildSummaryRow(
                            icon: Icons.man,
                            label: 'PATIENT:',
                            value: 'John Doe',
                          ),
                          const SizedBox(height: 10),
                          _buildSummaryRow(
                            icon: Icons.location_on,
                            label: 'REASON:',
                            value: 'General Checkup',
                          ),
                          const SizedBox(height: 10),
                          _buildSummaryRow(
                            icon: Icons.healing,
                            label: 'SPECIALITY:',
                            value: 'Cardiology',
                          ),
                          const SizedBox(height: 10),
                          _buildSummaryRow(
                            icon: Icons.medical_services_outlined,
                            label: 'DOCTOR:',
                            value: 'Dr. Smith',
                          ),
                          const SizedBox(height: 10),
                          _buildSummaryRow(
                            icon: Icons.access_time,
                            label: 'TURN:',
                            value: '10:30 AM, 12 Dec 2024',
                          ),
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "S/ 42.00",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Confirm and Pay',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 24, color: Colors.black87),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            '$label $value',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
