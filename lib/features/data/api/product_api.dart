import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/constant/api_url.dart';
import '../model/productmodel.dart';


class ProductController {
   String apiUrl = "${ApiUrls().baseUrl}${ApiUrls().product}";
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
