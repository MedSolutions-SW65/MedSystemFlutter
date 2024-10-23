import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CurrentTreatmentsScreen extends StatefulWidget {
  const CurrentTreatmentsScreen({super.key});

  @override
  State<CurrentTreatmentsScreen> createState() =>
      _CurrentTreatmentsScreenState();
}

class _CurrentTreatmentsScreenState extends State<CurrentTreatmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Treatments for Patients',
              style: TextStyle(fontSize: 24, color: Colors.white)),
          backgroundColor: const Color.fromRGBO(46, 63, 110, 1),
        ),
        backgroundColor: const Color.fromRGBO(46, 63, 110, 1),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Current Treatments',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Physioterapy',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 5),
                      child: Row(
                        children: [
                          Text('Patient: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('John Doe'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 5, 0, 5),
                      child: Row(
                        children: [
                          Text('Dose: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('No se :v'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 5, 0, 5),
                      child: Row(
                        children: [
                          Text('Duration: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('1 month'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 5, 0, 16),
                      child: Row(
                        children: [
                          Text('Frequency: ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('3 times a week'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(200, 203, 207, 219),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GNav(
                color: Colors.black,
                activeColor: Colors.black,
                tabBackgroundColor: const Color.fromARGB(200, 96, 196, 209),
                gap: 8,
                padding: const EdgeInsets.all(16),
                duration: const Duration(milliseconds: 900),
                onTabChange: (index) {
                  debugPrint('$index');
                },
                tabs: const [
                  GButton(icon: Icons.delete, text: 'Delete'),
                  GButton(icon: Icons.history, text: 'History'),
                  GButton(icon: Icons.add, text: 'Add'),
                ],
              ),
            ),
          ),
        ));
  }
}
