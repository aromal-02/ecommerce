import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../core/constant/api_url.dart';

class LoginController {
  String apiUrl = "${ApiUrls().baseUrl}${ApiUrls().verify}";

  Future<String> verify(Map<String, String> body) async {
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
        bool user = responseData['user'];
        String token;
        if (user) {
          token = responseData['token']['access'];
        }
        else {
          throw Exception('User not found');
        }

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
}
