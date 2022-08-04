import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/ui/deeplink_screen.dart';
import 'package:test/utils/app_router.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample screen'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(children: [
              TextButton(
                onPressed: () {
                  Get.toNamed(
                    AppRouter.deeplinkScreen,
                    arguments: DeeplinkScreenArguments('accessCode'),
                  );
                },
                child: const Text('Deeplink'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
