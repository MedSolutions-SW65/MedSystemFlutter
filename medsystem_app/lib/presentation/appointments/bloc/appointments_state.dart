import 'package:medsystem_app/domain/appointment.dart';

abstract class AppointmentsState {}

class AppointmentsInitialState extends AppointmentsState{}

class AppointmentsLoadingState extends AppointmentsState{}

class AppointmentsLoadedState extends AppointmentsState{
  List<Appointment> appointments;
  AppointmentsLoadedState({required this.appointments});
}

class AppointmentsErrorState extends AppointmentsState{
  String message;
  AppointmentsErrorState({required this.message});
}