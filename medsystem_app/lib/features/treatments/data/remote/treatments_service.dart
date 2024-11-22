import 'dart:convert';
import 'dart:io';

import 'package:medsystem_app/features/treatments/domain/treatment.dart';
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
  Future<Treatment?> postTreatments(
      String treatmentName,
      String description,
      String startDate,
      String endDate,
      String patientId,
      String doctorId) async {
    try {
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
          doctorId: int.parse(doctorId),
        ).toMap()),
      );
      if (response.statusCode == 201) {
        Map<String, dynamic> json = jsonDecode(response.body);
        final treatment = Treatment.fromJson(json);
        return treatment;
      } else {
        throw Exception('Invalid response from server');
      }
    } catch (e) {
      rethrow;
    }
  }
}

class DeleteTreatmentService {
  final String baseUrl;

  DeleteTreatmentService({required this.baseUrl});

  Future<void> deleteTreatment(String treatmentName) async {
    final url = Uri.parse('$baseUrl/$treatmentName');

    try {
      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        print('Treatment deleted successfully');
      } else {
        final responseBody = jsonDecode(response.body);
        final errorMessage =
            responseBody['error'] ?? 'Failed to delete treatment';
        print('Error deleting treatment: $errorMessage');
        throw Exception(errorMessage);
      }
    } catch (e) {
      print('Error deleting treatment: $e');
      throw Exception('Error deleting treatment: $e');
    }
  }
}