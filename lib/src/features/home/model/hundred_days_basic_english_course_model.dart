class HundredDaysBasicEnglishModel {
  List<BeginnerList>? beginnerList;

  HundredDaysBasicEnglishModel({this.beginnerList});

  HundredDaysBasicEnglishModel.fromJson(Map<String, dynamic> json) {
    if (json['beginner_list'] != null) {
      beginnerList = <BeginnerList>[];
      json['beginner_list'].forEach((v) {
        beginnerList!.add(BeginnerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (beginnerList != null) {
      data['beginner_list'] =
          beginnerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BeginnerList {
  int? id;
  String? title;
  String? thumbnail;
  String? youtubeLink;
  String? shortDescription;
  String? description;
  String? streamedLiveOn;
  int? totalViews;
  String? status;

  BeginnerList(
      {this.id,
        this.title,
        this.thumbnail,
        this.youtubeLink,
        this.shortDescription,
        this.description,
        this.streamedLiveOn,
        this.totalViews,
        this.status});

  BeginnerList.fromJson(Map<String, dynamic> json) {
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




// class HundredDaysBasicEnglishCourseData {
//   int? id;
//   String? title;
//   String? thumbnail;
//   String? youtubeLink;
//   String? shortDescription;
//   String? description;
//   String? streamedLiveOn;
//   int? totalViews;
//   String? status;
//
//   HundredDaysBasicEnglishCourseData(
//       {this.id,
//         this.title,
//         this.thumbnail,
//         this.youtubeLink,
//         this.shortDescription,
//         this.description,
//         this.streamedLiveOn,
//         this.totalViews,
//         this.status});
//
//   HundredDaysBasicEnglishCourseData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     thumbnail = json['thumbnail'];
//     youtubeLink = json['youtubeLink'];
//     shortDescription = json['shortDescription'];
//     description = json['description'];
//     streamedLiveOn = json['streamedLiveOn'];
//     totalViews = json['totalViews'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['title'] = title;
//     data['thumbnail'] = thumbnail;
//     data['youtubeLink'] = youtubeLink;
//     data['shortDescription'] = shortDescription;
//     data['description'] = description;
//     data['streamedLiveOn'] = streamedLiveOn;
//     data['totalViews'] = totalViews;
//     data['status'] = status;
//     return data;
//   }
// }
