import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/models/category/category.dart';
import 'package:test/utils/app_router.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Get.toNamed(AppRouter.categoryDetailScreen),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.network(
                  category.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Text(
                category.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      );
}
