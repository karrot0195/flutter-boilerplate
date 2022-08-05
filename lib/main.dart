import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:test/ui/deeplink_screen.dart';
import 'package:test/utils/app_router.dart';
import 'package:uni_links/uni_links.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    handleDeeplink();
  }

  @override
  Widget build(BuildContext context) {
    return _app(context);
  }

  void handleDeeplink() {
    Logger().d('running');
    uriLinkStream.listen((event) {
      Logger().d('received signal');
      if (event?.path == '/deeplink') {
        Get.toNamed(
          AppRouter.deeplinkScreen,
          arguments: DeeplinkScreenArguments(
              event?.queryParameters['accessCode'] ?? ''),
        );
      }
    });
  }

  Widget _app(BuildContext context) {
    return GetMaterialApp(
      routes: AppRouter.routers(context),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
