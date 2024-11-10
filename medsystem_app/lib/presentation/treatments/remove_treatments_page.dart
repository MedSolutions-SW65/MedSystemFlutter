import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medsystem_app/presentation/treatments/treatments_page.dart';

class RemoveTreatmentsPage extends StatefulWidget {
  const RemoveTreatmentsPage({super.key});

  @override
  State<RemoveTreatmentsPage> createState() => _RemoveTreatmentsPageState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _RemoveTreatmentsPageState extends State<RemoveTreatmentsPage> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(46, 63, 110, 1),
      appBar: AppBar(
        title: const Text(
          'Remove Treatments',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(46, 63, 110, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TreatmentsScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(46, 63, 110, 1),
                    padding: const EdgeInsets.all(5),
                    minimumSize: const Size(20, 30),
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Treatment List',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Select the treatment you want to remove:',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        Form(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: double.infinity,
                                child: DropdownButtonFormField<String>(
                                  value: dropdownValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Acción para eliminar el tratamiento seleccionado
                                },
                                child: const Text("Remove"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
