import 'package:flutter/material.dart';
import 'package:test/ui/deeplink_screen.dart';
import 'package:test/ui/sample_screen.dart';

class AppRouter {
  static const String sampleScreen = '/';
  static const String deeplinkScreen = '/deeplink';

  static Map<String, WidgetBuilder> routers(BuildContext context) {
    return {
      sampleScreen: (_) => const SampleScreen(),
      deeplinkScreen: (_) => const DeeplinkScreen(),
    };
  }
}
