class BasicEnglishCourseModel {
  final int? id;
  final String title;
  final String videoUrl;
  final String thumbnail;
  final String shortDescription;

  BasicEnglishCourseModel({
    this.id,
    required this.title,
    required this.videoUrl,
    required this.thumbnail,
    required this.shortDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'videoUrl': videoUrl,
      'thumbnail': thumbnail,
      'shortDescription': shortDescription,
    };
  }

  static BasicEnglishCourseModel fromMap(Map<String, dynamic> map) {
    return BasicEnglishCourseModel(
      id: map['id'],
      title: map['title'],
      videoUrl: map['videoUrl'],
      thumbnail: map['thumbnail'],
      shortDescription: map['shortDescription'],
    );
  }

  // Adding fromJson method
  factory BasicEnglishCourseModel.fromJson(Map<String, dynamic> json) {
    return BasicEnglishCourseModel(
      id: json['id'],
      title: json['title'],
      videoUrl: json['videoUrl'],
      thumbnail: json['thumbnail'],
      shortDescription: json['shortDescription'],
    );
  }
}