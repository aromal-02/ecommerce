import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../core/constant/api_url.dart';

class RegisterController {
  String apiUrl = "${ApiUrls().baseUrl}${ApiUrls().login_reg}";

  Future<String> register(Map<String, String> body) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        String token = responseData['token']['access'];
        
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        print("Token saved: $token");
        return token;
      } else {
        throw Exception('Failed to register: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error registering user: $e');
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
  Future<http.Response> fetchDataWithAuth(String endpoint) async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('auth_token');

  final response = await http.get(
    Uri.parse("${ApiUrls().baseUrl}$endpoint"),
    headers: {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    },
  );

  return response;
}

}
