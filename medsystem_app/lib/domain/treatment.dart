class Treatment {
  int id;
  String treatmentName;
  String description;
  String startDate;
  String endDate;
  int patientId;

  Treatment(
      {required this.id,
      required this.treatmentName,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.patientId});

  String get period => '$startDate - $endDate';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'treatmentName': treatmentName,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'patientId': patientId,
    };
  }

  factory Treatment.fromJson(Map<String, dynamic> json) {
    return Treatment(
      id: json['id'] ?? -1,
      treatmentName: json['treatmentName'] ?? '',
      description: json['description'] ?? '',
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      patientId: json['patientId'] ?? -1,
    );
  }
}
