import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medsystem_app/presentation/bloc/treatments_bloc.dart';
import 'package:medsystem_app/presentation/bloc/treatments_event.dart';
import 'package:medsystem_app/presentation/bloc/treatments_state.dart';

class CurrentTreatmentsScreen extends StatefulWidget {
  const CurrentTreatmentsScreen({super.key});

  @override
  State<CurrentTreatmentsScreen> createState() =>
      _CurrentTreatmentsScreenState();
}

class _CurrentTreatmentsScreenState extends State<CurrentTreatmentsScreen> {
  @override
  void initState() {
    context.read<TreatmentsBloc>().add(GetTreatments());
    super.initState();
  }

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
          BlocBuilder<TreatmentsBloc, TreatmentsState>(
              builder: (context, state) {
            if (state is TreatmentsLoadingState) {
              return const CircularProgressIndicator();
            } else {
              if (state is TreatmentsLoadedState) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.treatments.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(state.treatments[index].treatmentName,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 5),
                              child: Row(
                                children: [
                                  const Text('Patient: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(state.treatments[index].patientId.toString()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 5, 0, 5),
                              child: Row(
                                children: [
                                  const Text('Description: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(state.treatments[index].description),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 5, 20, 20),
                              child: Row(
                                children: [
                                  const Text('Period: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(state.treatments[index].period),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              else {
                if (state is TreatmentsErrorState) {
                              return  Text(state.message);
                }
              }
            }
            return const Text('Current Treatments');
          })
        ],
      ),
    );
  }
}
