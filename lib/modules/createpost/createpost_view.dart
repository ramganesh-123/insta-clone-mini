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
            SizedBox(height: 16),

            Obx(() {
              final image = controller.selectedImage.value;
              return GestureDetector(
                onTap: controller.pickImage,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: image == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_photo_alternate, size: 60),
                            SizedBox(height: 8),
                            Text('Tap to select image'),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(image, fit: BoxFit.cover),
                        ),
                ),
              );
            }),

            SizedBox(height: 16),

            GestureDetector(
              onTap: () {
                controller.createPost();
              },
              child: Container(
                padding: EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: Colors.cyanAccent,

                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('create post'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
