import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'feed_controller.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FeedController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Mini Feed'), centerTitle: true),
      body: Center(child: Text('No Data')),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToCreatePost,
        child: const Icon(Icons.add),
      ),
    );
  }
}
