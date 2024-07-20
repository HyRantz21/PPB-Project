import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = "http://127.0.0.1:8000/api";

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/register'), body: {
      'name': name,
      'email': email,
      'password': password,
    });
    return json.decode(response.body);
  }

  // login
  Future<Map<String, dynamic>> login(String name, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {
        'name': name,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var data = json.decode(response.body);
      var tokenData = data['token'];
      await prefs.setString('token', tokenData);
      print('200');
    } else {
      print('400');
    }
    return json.decode(response.body);
  }

  // Logout
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.post(
      Uri.parse('$baseUrl/logout'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      await prefs.remove('token');
    }
  }
}
