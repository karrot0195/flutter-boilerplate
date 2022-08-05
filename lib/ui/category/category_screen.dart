import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/desgin/space.dart';
import 'package:test/models/category/category.dart';
import 'package:test/services/category_service.dart';
import 'package:test/ui/common/category_item.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  Category? category;
  List<Category> recommededCategories = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    ref.read(categoryServiceProvider).getList().then((value) {
      setState(() {
        category = value[0];
        recommededCategories = value.sublist(0, 3);
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
        title: const Text('Category detail'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: category != null
                ? _buildDetail(category!)
                : const Center(
                    child: Icon(Icons.local_dining),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(Category e) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                e.name,
                style: const TextStyle(fontSize: 18),
              ),
              spaceH10,
              Image(image: NetworkImage(e.imageUrl)),
              spaceH10,
              Text(
                e.descr,
                style: const TextStyle(fontSize: 12),
              ),
              spaceH10,
              _buildRecommededCategories,
            ],
          ),
        ),
      );

  get _buildRecommededCategories => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recommendation',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
          CarouselSlider(
            items: recommededCategories
                .map((category) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: CategoryItem(category: category),
                    ))
                .toList(),
            options: CarouselOptions(
              autoPlay: true,
            ),
          )
        ],
      );
}
