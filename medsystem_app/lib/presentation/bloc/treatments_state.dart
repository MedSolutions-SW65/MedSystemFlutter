import 'package:medsystem_app/domain/treatment.dart';

abstract class TreatmentsState {}

class TreatmentsInitialState extends TreatmentsState {}

class TreatmentsLoadingState extends TreatmentsState {}

class TreatmentsLoadedState extends TreatmentsState {
  List<Treatment> treatments;
  TreatmentsLoadedState({required this.treatments});
}

class TreatmentsErrorState extends TreatmentsState {
  String message;
  TreatmentsErrorState({required this.message});
}

class TreatmentsAddedState extends TreatmentsState {
  Treatment treatment;
  TreatmentsAddedState({required this.treatment});
}

class TreatmentsDeletedState extends TreatmentsState {}
