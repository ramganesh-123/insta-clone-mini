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
      body: Center(child: Text('creating post')),
    );
  }
}
