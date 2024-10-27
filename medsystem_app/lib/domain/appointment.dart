class Appointment {
  final int doctorId;
  final int patientId;
  final String date;
  final String reason;
  final String specialty;

  Appointment({
    required this.doctorId,
    required this.patientId,
    required this.date,
    required this.reason,    
    required this.specialty,
  });

  Appointment.fromJson(Map<String, dynamic> json)
      : doctorId = json['doctorId'], 
        patientId = json['patientId'],
        date = json['date'],
        reason = json['reason'],
        specialty = json['specialty'];
}
