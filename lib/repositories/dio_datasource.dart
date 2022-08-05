import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test/repositories/dio_repository.dart';

final dioProvider = Provider<DioRepository>((ref) => DioDatasource());

class DioDatasource extends DioRepository {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: 'http://192.168.1.11:3000', contentType: 'application/json'));

  @override
  Future<dynamic> get(String uri) async {
    final rs = await _dio.get(uri);
    return rs.data;
  }
}
