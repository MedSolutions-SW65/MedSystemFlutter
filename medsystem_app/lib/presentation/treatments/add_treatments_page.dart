import 'package:flutter/material.dart';

class AddTreatmentsScreen extends StatefulWidget {
  const AddTreatmentsScreen({super.key});

  @override
  State<AddTreatmentsScreen> createState() => _AddTreatmentsScreenState();
}

class _AddTreatmentsScreenState extends State<AddTreatmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Treatments',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(46, 63, 110, 1),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text('Content goes here'),
      ),
    );
  }
}
