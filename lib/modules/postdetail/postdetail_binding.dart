import 'package:get/get.dart';
import 'package:insta_clone_mini/modules/postdetail/postdetail_controller.dart';

class PostDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<PostDetailController>(() => PostDetailController());
  }
}
