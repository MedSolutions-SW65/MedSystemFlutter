
abstract class TreatmentsEvent {
  const TreatmentsEvent();
}

class GetTreatments extends TreatmentsEvent {
  GetTreatments();
}

class AddTreatment extends TreatmentsEvent {
  final String treatmentName;
  final String description;
  final String startDate;
  final String endDate;
  final int patientId;
  final int doctorId;

  const AddTreatment({
    required this.treatmentName,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.patientId,
    required this.doctorId,
  });
}

class DeleteTreatmentEvent extends TreatmentsEvent {
  final String treatmentName;

  DeleteTreatmentEvent(this.treatmentName);

  @override
  List<Object> get props => [treatmentName];
}