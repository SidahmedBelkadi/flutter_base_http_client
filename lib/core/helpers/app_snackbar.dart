import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  AppSnackbar._();

  static errorSnackBar(
      {String title = "Error", String message = "Something went wrong"}) {
    return Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 3),
      backgroundColor: const Color.fromARGB(255, 255, 222, 102),
      colorText: Colors.black,
    );
  }
}
