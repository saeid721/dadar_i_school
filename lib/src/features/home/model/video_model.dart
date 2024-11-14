class HundredDaysBasicEnglishCourseModel {
  final int? id;
  final String title;
  final String videoUrl;
  final String thumbnail;
  final String shortDescription;
  bool isLoading = true;
  dynamic controller;

  HundredDaysBasicEnglishCourseModel({
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

  static HundredDaysBasicEnglishCourseModel fromMap(Map<String, dynamic> map) {
    return HundredDaysBasicEnglishCourseModel(
      id: map['id'],
      title: map['title'],
      videoUrl: map['videoUrl'],
      thumbnail: map['thumbnail'],
      shortDescription: map['shortDescription'],
    );
  }

  // Adding fromJson method
  factory HundredDaysBasicEnglishCourseModel.fromJson(Map<String, dynamic> json) {
    return HundredDaysBasicEnglishCourseModel(
      id: json['id'],
      title: json['title'],
      videoUrl: json['videoUrl'],
      thumbnail: json['thumbnail'],
      shortDescription: json['shortDescription'],
    );
  }
}