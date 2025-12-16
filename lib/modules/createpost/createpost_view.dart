import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone_mini/modules/createpost/createpost_controller.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreatePostController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Create Post'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller.uploaderNameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.captionController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Caption',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
