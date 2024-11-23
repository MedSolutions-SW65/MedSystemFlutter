import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medsystem_app/features/treatments/presentation/blocs/treatments_bloc.dart';
import 'package:medsystem_app/features/treatments/presentation/blocs/treatments_event.dart';
import 'package:medsystem_app/features/treatments/presentation/blocs/treatments_state.dart';
import 'package:medsystem_app/presentation/treatments/treatments_page.dart';

class AddTreatmentsScreen extends StatefulWidget {
  const AddTreatmentsScreen({super.key});

  @override
  State<AddTreatmentsScreen> createState() => _AddTreatmentsScreenState();
}

class _AddTreatmentsScreenState extends State<AddTreatmentsScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _treatmentController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _patientIdController = TextEditingController();
  final TextEditingController _doctorIdController = TextEditingController();

  void _clearFields() {
    _treatmentController.clear();
    _descriptionController.clear();
    _startDateController.clear();
    _endDateController.clear();
    _patientIdController.clear();
    _doctorIdController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocConsumer<TreatmentsBloc, TreatmentsState>(
            listener: (context, state) {
              if (state is TreatmentsAddedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Los datos se guardaron correctamente'),
                  ),
                );
                _clearFields(); // Limpiar los campos de texto
              } else if (state is TreatmentsErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: ${state.message}'),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Container(
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
              );
            },
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.transparent),
                  onPressed: () {
                    
                  },
                ),
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'Add New Treatment',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Color.fromRGBO(46, 63, 110, 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  _buildTextField(
                                    controller: _treatmentController,
                                    label: 'Name of Treatment',
                                  ),
                                  const SizedBox(height: 10),
                                  _buildTextField(
                                    controller: _descriptionController,
                                    label: 'Description',
                                  ),
                                  const SizedBox(height: 10),
                                  _buildTextField(
                                    controller: _startDateController,
                                    label: 'Start Date',
                                  ),
                                  const SizedBox(height: 10),
                                  _buildTextField(
                                    controller: _endDateController,
                                    label: 'End Date',
                                  ),
                                  const SizedBox(height: 10),
                                  _buildTextField(
                                    controller: _patientIdController,
                                    label: 'Id del paciente',
                                  ),
                                  const SizedBox(height: 10),
                                  _buildTextField(
                                    controller: _doctorIdController,
                                    label: 'Id del doctor',
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<TreatmentsBloc>(context)
                                            .add(
                                          AddTreatment(
                                              treatmentName:
                                                  _treatmentController.text,
                                              description:
                                                  _descriptionController.text,
                                              startDate:
                                                  _startDateController.text,
                                              endDate: _endDateController.text,
                                              patientId: int.parse(
                                                  _patientIdController.text),
                                              doctorId: int.parse(
                                                  _doctorIdController.text)),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14.0,
                                        horizontal: 24.0,
                                      ),
                                    ),
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}