class Treatment {
  int id;
  String treatmentName;
  String description;
  String startDate;
  String endDate;
  String? period;
  int patientId;
  int doctorId;

  Treatment(
      {required this.id,
      required this.treatmentName,
      required this.description,
      required this.startDate,
      required this.endDate,
      this.period,
      required this.patientId,
      required this.doctorId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'treatmentName': treatmentName,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      if (period != null) 'period': period,
      'patientId': patientId,
      'doctorId': doctorId,
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
      period: json['period'],
      doctorId: json['doctorId'] ?? -1,
    );
  }
}