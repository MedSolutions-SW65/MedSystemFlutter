import 'package:flutter/material.dart';
import 'package:medsystem_app/presentation/treatments/treatments_page.dart';

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
      backgroundColor: const Color.fromRGBO(46, 63, 110, 1),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                ElevatedButton(
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
                    padding: const EdgeInsets.fromLTRB(30, 5, 5, 5),
                    minimumSize: const Size(20, 30),
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Card(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Add Treatments',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Form(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Name of Patients'),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  }),
                              TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Name of Treatments'),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  }),
                              TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Description'),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  }),
                              TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Period'),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  }),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                    onPressed: null, child: Text("Submit")),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
