class HundredDaysBasicEnglishModel {
  List<HundredDaysBasicEnglishList>? hundredDaysBasicEnglishList;

  HundredDaysBasicEnglishModel({this.hundredDaysBasicEnglishList});

  HundredDaysBasicEnglishModel.fromJson(Map<String, dynamic> json) {
    if (json['hundred_days_basic_english_list'] != null) {
      hundredDaysBasicEnglishList = <HundredDaysBasicEnglishList>[];
      json['hundred_days_basic_english_list'].forEach((v) {
        hundredDaysBasicEnglishList!
            .add(HundredDaysBasicEnglishList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hundredDaysBasicEnglishList != null) {
      data['hundred_days_basic_english_list'] =
          hundredDaysBasicEnglishList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HundredDaysBasicEnglishList {
  int? id;
  String? title;
  String? thumbnail;
  String? youtubeLink;
  String? shortDescription;
  String? description;
  String? streamedLiveOn;
  int? totalViews;
  String? status;

  HundredDaysBasicEnglishList(
      {this.id,
        this.title,
        this.thumbnail,
        this.youtubeLink,
        this.shortDescription,
        this.description,
        this.streamedLiveOn,
        this.totalViews,
        this.status});

  HundredDaysBasicEnglishList.fromJson(Map<String, dynamic> json) {
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
