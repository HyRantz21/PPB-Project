import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8000/api";

  // login
  Future<Map<String, dynamic>> login(String name, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/logins'),
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

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('Token: $token');

    final response = await http.post(
      Uri.parse('$baseUrl/logouts'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      print('Logout successful');
      // Remove token from SharedPreferences
      await prefs.remove('token');
    } else {
      // Handle error
      print('Failed to logout');
      throw Exception('Failed to logout');
    }
  }
}
