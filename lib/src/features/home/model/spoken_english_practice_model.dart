class SpokenEnglishPracticeModel {
  List<SpokenEnglishPracticeList>? spokenEnglishPracticeList;

  SpokenEnglishPracticeModel({this.spokenEnglishPracticeList});

  SpokenEnglishPracticeModel.fromJson(Map<String, dynamic> json) {
    if (json['spoken_english_practice_list'] != null) {
      spokenEnglishPracticeList = <SpokenEnglishPracticeList>[];
      json['spoken_english_practice_list'].forEach((v) {
        spokenEnglishPracticeList!
            .add(SpokenEnglishPracticeList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (spokenEnglishPracticeList != null) {
      data['spoken_english_practice_list'] =
          spokenEnglishPracticeList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SpokenEnglishPracticeList {
  int? id;
  String? title;
  String? thumbnail;
  String? youtubeLink;
  String? shortDescription;
  String? description;
  String? streamedLiveOn;
  int? totalViews;
  String? status;

  SpokenEnglishPracticeList(
      {this.id,
        this.title,
        this.thumbnail,
        this.youtubeLink,
        this.shortDescription,
        this.description,
        this.streamedLiveOn,
        this.totalViews,
        this.status});

  SpokenEnglishPracticeList.fromJson(Map<String, dynamic> json) {
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
