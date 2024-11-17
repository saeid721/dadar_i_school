class EnglishGrammarCourseModel {
  List<EnglishGrammarCourseList>? englishGrammarCourseList;

  EnglishGrammarCourseModel({this.englishGrammarCourseList});

  EnglishGrammarCourseModel.fromJson(Map<String, dynamic> json) {
    if (json['english_grammar_course_list'] != null) {
      englishGrammarCourseList = <EnglishGrammarCourseList>[];
      json['english_grammar_course_list'].forEach((v) {
        englishGrammarCourseList!.add(EnglishGrammarCourseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (englishGrammarCourseList != null) {
      data['english_grammar_course_list'] =
          englishGrammarCourseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EnglishGrammarCourseList {
  int? id;
  String? title;
  String? thumbnail;
  String? youtubeLink;
  String? shortDescription;
  String? description;
  String? streamedLiveOn;
  int? totalViews;
  String? status;

  EnglishGrammarCourseList(
      {this.id,
        this.title,
        this.thumbnail,
        this.youtubeLink,
        this.shortDescription,
        this.description,
        this.streamedLiveOn,
        this.totalViews,
        this.status});

  EnglishGrammarCourseList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    youtubeLink = json['youtubeLink'];
    shortDescription = json['shortDescription'];
    description = json['description'];
    streamedLiveOn = json['streamedLiveOn'];
    totalViews = json['totalViews'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['youtubeLink'] = youtubeLink;
    data['shortDescription'] = shortDescription;
    data['description'] = description;
    data['streamedLiveOn'] = streamedLiveOn;
    data['totalViews'] = totalViews;
    data['status'] = status;
    return data;
  }
}
