import 'dart:convert';
import 'dart:io';

import 'package:medsystem_app/domain/appointment.dart';
import 'package:http/http.dart' as http;

class AppointmentsService {
  final baseUrl = 'http://10.0.2.2:8080/api/v1/appointments';

  Future<List<Appointment>> getAppointments() async {
    Uri uri = Uri.parse(baseUrl);
    http.Response response = await http.get(uri);
    if (response.statusCode == HttpStatus.ok){
      List maps = jsonDecode(response.body);
      return maps.map((json) => Appointment.fromJson(json)).toList();
    }
    return [];
  }
}