import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_p3_flutter/models/usuario.dart';

class UsuarioService {
  final String _baseUrl = "http://192.168.103:8888";

  Future<bool> validarCredenciales(String nombre, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/usuarios/validate'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nombre': nombre, 'password': password}),
      );

      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 401) {
        return false;
      } else {
        print('Error en validarCredenciales: ${response.body}');
        throw Exception('Fallo al validar los datos: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error en validarCredenciales: $e');
      throw Exception('Fallo al cargar el usuario: $e');
    }
  }

  Future<Usuario> crearUsuario(String nombre, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/usuarios'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nombre': nombre, 'password': password}),
      );

      if (response.statusCode == 200) {
        return Usuario.fromJson(jsonDecode(response.body));
      } else {
        print('Error en crearUsuario: ${response.body}');
        throw Exception('Fallo al crear usuario: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error en crearUsuario: $e');
      throw Exception('Fallo al crear el usuario: $e');
    }
  }

  Future<Usuario> actualizarUsuario(int id, String nombre, String password) async {
    try {
      final response = await http.put(
        Uri.parse('$_baseUrl/usuarios/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'nombre': nombre, 'password': password}),
      );

      if (response.statusCode == 200) {
        return Usuario.fromJson(jsonDecode(response.body));
      } else {
        print('Error en actualizarUsuario: ${response.body}');
        throw Exception('Fallo al actualizar usuario: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error en actualizarUsuario: $e');
      throw Exception('Fallo al actualizar el usuario: $e');
    }
  }

  Future<void> eliminarUsuario(int id) async {
    try {
      final response = await http.delete(Uri.parse('$_baseUrl/usuarios/$id'));

      if (response.statusCode != 200) {
        print('Error en eliminarUsuario: ${response.body}');
        throw Exception('Fallo al eliminar usuario: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error en eliminarUsuario: $e');
      throw Exception('Fallo al eliminar el usuario: $e');
    }
  }
}
