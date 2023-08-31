import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final String baseUrl;
  final String apiKey;
  final Dio dio;

  ApiService({required this.baseUrl, required this.apiKey}) : dio = Dio();

  Future<Map<String, dynamic>> fetchCurrencies() async {
    try {
      final response = await dio.get('$baseUrl/api/latest', queryParameters: {
        'access_key': apiKey,
      });
      if (kDebugMode) {
        print(response.data);
      }
      return response.data;
    } catch (e) {
      throw Exception('Failed to load currencies');
    }
  }
}
