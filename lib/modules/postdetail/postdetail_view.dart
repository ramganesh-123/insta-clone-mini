import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_clone_mini/modules/postdetail/postdetail_controller.dart';
import 'package:intl/intl.dart';

class PostDetailView extends StatelessWidget {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PostDetailController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Post Detail'), centerTitle: true),
      body: Obx(() {
        final post = controller.post.value;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          child: Text(
                            post.uploaderName[0],
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.uploaderName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                DateFormat(
                                  'MMMM dd, yyyy • hh:mm a',
                                ).format(post.timestamp),
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    Row(
                      children: [
                        Obx(() {
                          bool isLiked = controller.isLikedByCurrentUser();

                          return IconButton(
                            icon: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: isLiked ? Colors.red : Colors.grey,
                              size: 28,
                            ),
                            onPressed: controller.toggleLike,
                          );
                        }),
                        Obx(() {
                          return Text(
                            '${controller.post.value.likesCount} likes',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          );
                        }),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
