import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  // Fungsi untuk melakukan GET request
  Future<Response> fetchData(String endpoint) async {
    try {
      Response response = await _dio.get(endpoint);
      return response;
    } catch (error) {
      throw Exception("Error: $error");
    }
  }

  // Fungsi untuk melakukan POST request
  Future<Response> postData(String endpoint, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post(endpoint, data: data);
      return response;
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}
