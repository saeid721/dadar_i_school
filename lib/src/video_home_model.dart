import '../data.dart';

class BasicEnglishCourseModel {
  final int? id;
  final String title;
  final String youtubeLink;
  final String thumbnail;
  final String shortDescription;
  List<BasicEnglishCourseData>? data;

  BasicEnglishCourseModel({
    this.id,
    required this.title,
    required this.youtubeLink,
    required this.thumbnail,
    required this.shortDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'youtubeLink': youtubeLink,
      'thumbnail': thumbnail,
      'shortDescription': shortDescription,
    };
  }

  static BasicEnglishCourseModel fromMap(Map<String, dynamic> map) {
    return BasicEnglishCourseModel(
      id: map['id'],
      title: map['title'],
      youtubeLink: map['youtubeLink'],
      thumbnail: map['thumbnail'],
      shortDescription: map['shortDescription'],
    );
  }

  // Adding fromJson method
  factory BasicEnglishCourseModel.fromJson(Map<String, dynamic> json) {
    return BasicEnglishCourseModel(
      id: json['id'],
      title: json['title'],
      youtubeLink: json['youtubeLink'],
      thumbnail: json['thumbnail'],
      shortDescription: json['shortDescription'],
    );
  }
}
