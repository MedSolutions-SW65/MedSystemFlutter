import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medsystem_app/presentation/bloc/treatments_bloc.dart';
import 'package:medsystem_app/presentation/bloc/treatments_event.dart';
import 'package:medsystem_app/presentation/bloc/treatments_state.dart';
import 'package:medsystem_app/presentation/treatments/treatments_page.dart';

class RemoveTreatmentsPage extends StatefulWidget {
  const RemoveTreatmentsPage({super.key});

  @override
  State<RemoveTreatmentsPage> createState() => _RemoveTreatmentsPageState();
}

class _RemoveTreatmentsPageState extends State<RemoveTreatmentsPage> {
  @override
  Widget build(BuildContext context) {
    final treatmentsBloc = context.read<TreatmentsBloc>();

    return Scaffold(
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
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TreatmentsScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 80.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BlocConsumer<TreatmentsBloc, TreatmentsState>(
                    listener: (context, state) {
                      if (state is TreatmentsDeletedState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Treatment deleted successfully'),
                          ),
                        );
                        treatmentsBloc.add(GetTreatments());
                      } else if (state is TreatmentsErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is TreatmentsLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      } else if (state is TreatmentsLoadedState) {
                        return ListView.builder(
                          itemCount: state.treatments.length,
                          itemBuilder: (context, index) {
                            final treatment = state.treatments[index];
                            return Card(
                              color: Colors.white.withOpacity(0.9),
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text(
                                            treatment.treatmentName,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Color.fromRGBO(
                                                  46, 63, 110, 1),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        _buildDetailRow(
                                          label: 'Patient:',
                                          value: treatment.patientId.toString(),
                                        ),
                                        _buildDetailRow(
                                          label: 'Description:',
                                          value: treatment.description,
                                        ),
                                        _buildDetailRow(
                                          label: 'Period:',
                                          value: treatment.period ?? 'N/A',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: IconButton(
                                      onPressed: () => _confirmDelete(
                                        context,
                                        treatment.treatmentName,
                                      ),
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (state is TreatmentsErrorState) {
                        return Center(
                          child: Text(
                            state.message,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }
                      return const Center(
                        child: Text(
                          'No treatments found',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(46, 63, 110, 1),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(
      BuildContext context, String treatmentName) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Treatment'),
          content:
              const Text('Are you sure you want to delete this treatment?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (result == true) {
      context.read<TreatmentsBloc>().add(DeleteTreatmentEvent(treatmentName));
    }
  }
}
