import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostController extends GetxController {
  final TextEditingController captionController = TextEditingController();
  final TextEditingController uploaderNameController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  final Rx<File?> selectedImage = Rx<File?>(null);

  bool _validateInputs() {
    if (captionController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter a caption');
      return false;
    }

    if (uploaderNameController.text.trim().isEmpty) {
      Get.snackbar('Error', 'Please enter your name');
      return false;
    }
    if (selectedImage.value == null) {
      Get.snackbar('Error', 'Please select an image');
      return false;
    }

    return true;
  }

  Future<void> createPost() async {
    if (!_validateInputs()) return;
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );
      print('hhhhgh$image');
      if (image != null) {
        selectedImage.value = File(image.path);
        print('njjnjnjn ${selectedImage.value}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }
}
