class PostModel {
  final String id;
  final String caption;
  final String uploaderName;
  final DateTime timestamp;

  PostModel({
    required this.id,
    required this.caption,
    required this.uploaderName,
    required this.timestamp,
  });

  factory PostModel.fromJson(Map<String, dynamic> json, String id) {
    return PostModel(
      id: id,
      caption: json['caption'] ?? '',
      uploaderName: json['uploaderName'] ?? 'Anonymous',
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'caption': caption,
      'uploaderName': uploaderName,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  PostModel copyWith({
    String? id,
    String? caption,
    String? uploaderName,
    DateTime? timestamp,
  }) {
    return PostModel(
      id: id ?? this.id,
      caption: caption ?? this.caption,
      uploaderName: uploaderName ?? this.uploaderName,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
