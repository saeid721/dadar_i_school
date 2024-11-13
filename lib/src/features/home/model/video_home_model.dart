import '../data/hundred_days_basic_english_course_data.dart';

class HomeCourseModel {
  final int? id;
  final String title;
  final String youtubeLink;
  final String thumbnail;
  final String shortDescription;
  List<BasicEnglishCourseData>? data;

  HomeCourseModel({
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

  static HomeCourseModel fromMap(Map<String, dynamic> map) {
    return HomeCourseModel(
      id: map['id'],
      title: map['title'],
      youtubeLink: map['youtubeLink'],
      thumbnail: map['thumbnail'],
      shortDescription: map['shortDescription'],
    );
  }

  // Adding fromJson method
  factory HomeCourseModel.fromJson(Map<String, dynamic> json) {
    return HomeCourseModel(
      id: json['id'],
      title: json['title'],
      youtubeLink: json['youtubeLink'],
      thumbnail: json['thumbnail'],
      shortDescription: json['shortDescription'],
    );
  }
}


class SectionData {
  final String id;
  final String sectionType;
  final String title;

  SectionData({
    required this.id,
    required this.sectionType,
    required this.title,
  });
}
