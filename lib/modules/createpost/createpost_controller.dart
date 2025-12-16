import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostController extends GetxController {
  final TextEditingController captionController = TextEditingController();
  final TextEditingController uploaderNameController = TextEditingController();

  bool _validateInputs() {
    if (captionController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a caption');
      return false;
    }

    if (uploaderNameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter your name');
      return false;
    }

    return true;
  }

  Future<void> createPost() async {
    if (!_validateInputs()) return;
  }
}
