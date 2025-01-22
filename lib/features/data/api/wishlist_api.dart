// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// import '../../../core/constant/api_url.dart';

// class WishController {
//   String apiUrl = "${ApiUrls().baseUrl}${ApiUrls().wishlist}";

//   Future<Map<String, dynamic>> fetchUserData() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('auth_token');

//       if (token == null) {
//         throw Exception('No token found');
//       }
//       final response = await http.get(
//         Uri.parse(apiUrl),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $token',
//         },
//       );

//       if (response.statusCode == 200) {
//         print(response.body);
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to fetch user data: ${response.body}');
//       }
//     } catch (e) {
//       print('Error fetching user data: $e');
//       return {};
//     }
//   }
// }
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constant/api_url.dart';
import '../model/wishmodel.dart';
import 'package:http/http.dart' as http;

class WishList {
  final String apiUrl ="${ApiUrls().baseUrl}${ApiUrls().wishlist}";

  Future<List<WishlistItem>> fetchProducts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');
      if (token == null) {
        throw Exception('Token not found. Please log in again.');
      }

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => WishlistItem.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
