class PostModel {
  final String caption;
  final String uploaderName;

  PostModel({required this.caption, required this.uploaderName});

  factory PostModel.fromJson(Map<String, dynamic> json, String id) {
    return PostModel(
      caption: json['caption'] ?? '',
      uploaderName: json['uploaderName'] ?? 'Anonymous',
    );
  }

  Map<String, dynamic> toJson() {
    return {'caption': caption, 'uploaderName': uploaderName};
  }

  PostModel copyWith({String? caption, String? uploaderName}) {
    return PostModel(
      caption: caption ?? this.caption,
      uploaderName: uploaderName ?? this.uploaderName,
    );
  }
}
