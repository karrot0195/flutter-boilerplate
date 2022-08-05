import 'package:dio/dio.dart';
import 'package:test/models/category/category.dart';

class DioClient {
  final Dio _dio = Dio();
  final baseUrl = 'localhost:3000';

  Future<List<Category>> getCategories() async {
    final result = await _dio.get('/categories');
    return result.data as List<Category>;
  }
}
