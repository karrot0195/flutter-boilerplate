import 'package:flutter/material.dart';
import 'package:test/ui/category/category_screen.dart';
import 'package:test/ui/category/list_category_screen.dart';
import 'package:test/ui/deeplink_screen.dart';

class AppRouter {
  static const String categoriesScreen = '/';
  static const String categoryDetailScreen = '/categories/detail';
  static const String deeplinkScreen = '/deeplink';

  static Map<String, WidgetBuilder> routers(BuildContext context) {
    return {
      categoriesScreen: (_) => const ListCategoryScreen(),
      categoryDetailScreen: (_) => const CategoryScreen(),
      deeplinkScreen: (_) => const DeeplinkScreen(),
    };
  }
}
