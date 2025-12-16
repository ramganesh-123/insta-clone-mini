import 'package:get/get.dart';
import 'package:insta_clone_mini/modules/createpost/createpost_binding.dart';
import 'package:insta_clone_mini/modules/createpost/createpost_view.dart';
import 'package:insta_clone_mini/modules/feed/feed_binding.dart';
import 'package:insta_clone_mini/modules/feed/feed_view.dart';

class AppPages {
  static const initial = '/feed';

  static final routes = [
    GetPage(
      name: '/feed',
      page: () => const FeedView(),
      binding: FeedBinding(),
    ),
    GetPage(
      name: '/create-post',
      page: () => const CreatePostView(),
      binding: CreatePostBinding(),
    ),
  ];
}
