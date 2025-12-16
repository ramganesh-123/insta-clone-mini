import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
}
