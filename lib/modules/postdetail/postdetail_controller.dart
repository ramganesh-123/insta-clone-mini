import 'package:get/get.dart';
import 'package:insta_clone_mini/data/models/postmodel.dart';
import 'package:insta_clone_mini/data/services/firebase_services.dart';

class PostDetailController extends GetxController {
  final FirebaseService _firebaseService = Get.find<FirebaseService>();

  late final Rx<PostModel> post;
  final RxBool isLoading = false.obs;
  final String currentUserId = 'user_demo_123';

  @override
  void onInit() {
    super.onInit();
    post = (Get.arguments as PostModel).obs;
    loadPostDetails();
  }

  Future<void> loadPostDetails() async {
    try {
      isLoading.value = true;
      final updatedPost = await _firebaseService.getPostById(post.value.id);
      post.value = updatedPost;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  bool isLikedByCurrentUser() {
    return post.value.likedBy.contains(currentUserId);
  }

  Future<void> toggleLike() async {
    try {
      await _firebaseService.toggleLike(post.value.id, currentUserId);
      await loadPostDetails();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
