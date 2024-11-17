class BeginnerSpokenEnglishModel {
  List<BeginnerSpokenEnglishList>? beginnerSpokenEnglishList;

  BeginnerSpokenEnglishModel({this.beginnerSpokenEnglishList});

  BeginnerSpokenEnglishModel.fromJson(Map<String, dynamic> json) {
    if (json['beginner_spoken_english_list'] != null) {
      beginnerSpokenEnglishList = <BeginnerSpokenEnglishList>[];
      json['beginner_spoken_english_list'].forEach((v) {
        beginnerSpokenEnglishList!
            .add(BeginnerSpokenEnglishList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (beginnerSpokenEnglishList != null) {
      data['beginner_spoken_english_list'] =
          beginnerSpokenEnglishList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BeginnerSpokenEnglishList {
  int? id;
  String? title;
  String? thumbnail;
  String? youtubeLink;
  String? shortDescription;
  String? description;
  String? streamedLiveOn;
  int? totalViews;
  String? status;

  BeginnerSpokenEnglishList(
      {this.id,
        this.title,
        this.thumbnail,
        this.youtubeLink,
        this.shortDescription,
        this.description,
        this.streamedLiveOn,
        this.totalViews,
        this.status});

  BeginnerSpokenEnglishList.fromJson(Map<String, dynamic> json) {
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
