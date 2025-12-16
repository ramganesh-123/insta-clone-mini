import 'package:get/get.dart';
import 'package:insta_clone_mini/modules/createpost/createpost_controller.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<CreatePostController>(() => CreatePostController());
  }
}
