class PostModel {
  final String id;
  final String caption;
  final String uploaderName;
  final DateTime timestamp;
  final int likesCount;
  final List<String> likedBy;

  PostModel({
    required this.id,
    required this.caption,
    required this.uploaderName,
    required this.timestamp,
    this.likesCount = 0,
    this.likedBy = const [],
  });

  factory PostModel.fromJson(Map<String, dynamic> json, String id) {
    return PostModel(
      id: id,
      caption: json['caption'] ?? '',
      uploaderName: json['uploaderName'] ?? 'Anonymous',
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
      likesCount: json['likesCount'] ?? 0,
      likedBy: List<String>.from(json['likedBy'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'caption': caption,
      'uploaderName': uploaderName,
      'timestamp': timestamp.toIso8601String(),
      'likesCount': likesCount,
      'likedBy': likedBy,
    };
  }

  PostModel copyWith({
    String? id,
    String? imageUrl,
    String? caption,
    String? uploaderName,
    DateTime? timestamp,
    int? likesCount,
    List<String>? likedBy,
  }) {
    return PostModel(
      id: id ?? this.id,
      caption: caption ?? this.caption,
      uploaderName: uploaderName ?? this.uploaderName,
      timestamp: timestamp ?? this.timestamp,
      likesCount: likesCount ?? this.likesCount,
      likedBy: likedBy ?? this.likedBy,
    );
  }
}
