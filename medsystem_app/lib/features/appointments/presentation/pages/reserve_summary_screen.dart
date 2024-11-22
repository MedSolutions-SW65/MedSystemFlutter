import 'package:flutter/material.dart';
import 'package:medsystem_app/shared/presentation/pages/homepage.dart';

class ReserveSummaryScreen extends StatefulWidget {
  const ReserveSummaryScreen({super.key});

  @override
  State<ReserveSummaryScreen> createState() => _ReserveSummaryScreenState();
}

class _ReserveSummaryScreenState extends State<ReserveSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de pantalla
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
          // Título en la parte superior izquierda
          Positioned(
            top: 16,
            left: 16,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  'Reserve Summary',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Contenido principal
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 16.0, right: 16.0),
            child: Column(
              children: [
                // Cuadro reducido
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5, // 50% de la pantalla
                  child: Card(
                    color: const Color(0xFFEDF2FA),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
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
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homepage(),
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
