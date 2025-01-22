import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../core/constant/api_url.dart';
import '../model/bannermodel.dart';
import '../model/productmodel.dart';

class BannerController {
  String apiUrl = "${ApiUrls().baseUrl}${ApiUrls().banners}";
  Future<List<String>> fetchbanner() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        List<String> banners = [];
       
          for (var element in jsonData) {
            banners.add(element['image']);
          }


        return banners;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
