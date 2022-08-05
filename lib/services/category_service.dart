import 'package:riverpod/riverpod.dart';
import 'package:test/models/category/category.dart';
import 'package:test/repositories/dio_datasource.dart';
import 'package:test/repositories/dio_repository.dart';

final categoryServiceProvider =
    Provider<CategoryService>((ref) => CategoryService(ref.read));

class CategoryService {
  CategoryService(this._read);
  final Reader _read;
  DioRepository get _dio => _read(dioProvider);

  Future<List<Category>> getList() async {
    final rs = await _dio.get('/categories');
    final jsonList = rs as List<dynamic>;
    return jsonList.map((e) => Category.fromJson(e)).toList();
  }
}
