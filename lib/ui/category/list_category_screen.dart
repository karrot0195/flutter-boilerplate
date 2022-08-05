import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/models/category/category.dart';
import 'package:test/services/category_service.dart';
import 'package:test/ui/common/category_item.dart';

class ListCategoryScreen extends ConsumerStatefulWidget {
  const ListCategoryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListCategoryScreenState();
}

class _ListCategoryScreenState extends ConsumerState<ListCategoryScreen> {
  List<Category> categories = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    ref.read(categoryServiceProvider).getList().then((value) {
      setState(() {
        categories = value;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1.5,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: categories.map((e) => CategoryItem(category: e)).toList(),
          ),
        )),
      ),
    );
  }
}
