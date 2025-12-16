import 'package:get/get.dart';
import 'package:insta_clone_mini/data/models/postmodel.dart';
import 'package:insta_clone_mini/data/services/firebase_services.dart';

class FeedController extends GetxController {
  void navigateToCreatePost() {
    Get.toNamed('/create-post');
  }

  final FirebaseService _firebaseService = Get.find<FirebaseService>();

  final RxList<PostModel> posts = <PostModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadPosts();
  }

  void loadPosts() {
    isLoading.value = true;
    errorMessage.value = '';

    _firebaseService.getPosts().listen(
      (postsList) {
        posts.value = postsList;
        isLoading.value = false;
      },
      onError: (error) {
        errorMessage.value = error.toString();
        isLoading.value = false;
      },
    );
  }
}
