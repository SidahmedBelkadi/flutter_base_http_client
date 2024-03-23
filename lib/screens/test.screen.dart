import 'package:base_client/controllers/test.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TestController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Http Client"),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => ElevatedButton(
                onPressed: () => controller.getData(),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text("Fetch server"),
              ),
            ),
            Obx(
              () => ElevatedButton(
                onPressed: () => controller.postData(),
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator())
                    : const Text("Post server"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
