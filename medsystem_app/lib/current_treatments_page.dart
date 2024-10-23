import 'package:flutter/material.dart';

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
      backgroundColor: const Color.fromRGBO(46, 63, 110, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Current Treatments',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Physiotherapy',
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
                            Text('Desconocido'),
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
                        padding: EdgeInsets.fromLTRB(30, 5, 0, 5),
                        child: Row(
                          children: [
                            Text('Frequency: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('3 times a week'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 5, 0, 16),
                        child: Row(
                          children: [
                            Text('Notes: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Is necessary to do the exercises'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
