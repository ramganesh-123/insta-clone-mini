import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:insta_clone_mini/data/models/postmodel.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> createPost({
    required String caption,
    required String uploaderName,
  }) async {
    try {
      await _firestore.collection('posts').add({
        'caption': caption,
        'uploaderName': uploaderName,
        'timestamp': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('Failed to create post: $e');
    }
  }

  Stream<List<PostModel>> getPosts() {
    return _firestore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return PostModel.fromJson(doc.data(), doc.id);
          }).toList();
        });
  }

  Future<void> toggleLike(String postId, String userId) async {
    try {
      DocumentReference postRef = _firestore.collection('posts').doc(postId);

      await _firestore.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(postRef);

        if (!snapshot.exists) {
          throw Exception('Post does not exist');
        }

        Map<String, dynamic> postData = snapshot.data() as Map<String, dynamic>;

        List<String> likedByUsers = List<String>.from(
          postData['likedBy'] ?? [],
        );
        int currentLikesCount = postData['likesCount'] ?? 0;

        if (likedByUsers.contains(userId)) {
          likedByUsers.remove(userId);
          currentLikesCount = currentLikesCount - 1;
        } else {
          likedByUsers.add(userId);
          currentLikesCount = currentLikesCount + 1;
        }

        transaction.update(postRef, {
          'likedBy': likedByUsers,
          'likesCount': currentLikesCount,
        });
      });
    } catch (e) {
      throw Exception('Failed to toggle like: $e');
    }
  }

  Future<PostModel> getPostById(String postId) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('posts')
          .doc(postId)
          .get();

      if (!doc.exists) {
        throw Exception('Post not found');
      }

      Map<String, dynamic> postData = doc.data() as Map<String, dynamic>;
      return PostModel.fromJson(postData, doc.id);
    } catch (e) {
      throw Exception('Failed to get post: $e');
    }
  }
}
