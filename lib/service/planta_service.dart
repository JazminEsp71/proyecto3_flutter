import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_p3_flutter/models/planta.dart'; 

class PlantaService {
  final String _baseUrl = "http://192.168.103:8888"; 

  Future<List<Planta>> getAllPlantas() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/plantas'));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Planta> plantas = body.map((dynamic item) => Planta.fromJson(item)).toList();
        return plantas;
      } else {
        throw Exception('Error al cargar plantas');
      }
    } catch (e) {
      throw Exception('Error al cargar plantas: $e');
    }
  }

  Future<Planta> getPlantaById(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/plantas/$id'));
      if (response.statusCode == 200) {
        return Planta.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Error al cargar plantas');
      }
    } catch (e) {
     throw Exception('Error al cargar plantas: $e');
    }
  }
}
