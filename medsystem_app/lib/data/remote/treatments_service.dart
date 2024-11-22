import 'dart:convert';
import 'dart:io';

import 'package:medsystem_app/domain/treatment.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://10.0.2.2:8080/api/v1/treatments';

class TreatmentsService {
  Future<List<Treatment>> getTreatments() async {
    Uri uri = Uri.parse(baseUrl);
    http.Response response = await http.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      List maps = jsonDecode(response.body);
      return maps.map((json) => Treatment.fromJson(json)).toList();
    }
    return [];
  }
}

class AddTreatmentService {
  Future<Treatment?> postTreatments(String treatmentName, String description,
      String startDate, String endDate, String patientId) async {
    http.Response response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(Treatment(
        id: 0,
        treatmentName: treatmentName,
        description: description,
        startDate: startDate,
        endDate: endDate,
        patientId: int.parse(patientId),
      ).toMap()),
    );
    if (response.statusCode == HttpStatus.ok) {
      Map<String, dynamic> json = jsonDecode(response.body);
      final treatment = Treatment.fromJson(json);
      return treatment;
    }
    return null;
  }
}
