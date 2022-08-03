import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeeplinkScreenArguments {
  final String accessCode;

  DeeplinkScreenArguments(this.accessCode);
}

class DeeplinkScreen extends StatelessWidget {
  const DeeplinkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accessCode = (Get.arguments as DeeplinkScreenArguments).accessCode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deeplink'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Deep screen: $accessCode'),
        ),
      ),
    );
  }
}
