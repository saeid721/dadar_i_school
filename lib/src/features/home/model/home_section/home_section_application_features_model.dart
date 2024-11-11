class HomeSectionApplicationFeaturesModel {
  int? code;
  String? status;
  String? message;
  List<Data>? data;

  HomeSectionApplicationFeaturesModel(
      {this.code, this.status, this.message, this.data});

  HomeSectionApplicationFeaturesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? titleBn;
  String? titleHi;
  String? titleAr;
  String? icon;
  String? shortDescription;
  String? shortDescriptionBn;
  String? shortDescriptionHi;
  String? shortDescriptionAr;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.titleBn,
        this.titleHi,
        this.titleAr,
        this.icon,
        this.shortDescription,
        this.shortDescriptionBn,
        this.shortDescriptionHi,
        this.shortDescriptionAr,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleBn = json['title_bn'];
    titleHi = json['title_hi'];
    titleAr = json['title_ar'];
    icon = json['icon'];
    shortDescription = json['short_description'];
    shortDescriptionBn = json['short_description_bn'];
    shortDescriptionHi = json['short_description_hi'];
    shortDescriptionAr = json['short_description_ar'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['title_bn'] = titleBn;
    data['title_hi'] = titleHi;
    data['title_ar'] = titleAr;
    data['icon'] = icon;
    data['short_description'] = shortDescription;
    data['short_description_bn'] = shortDescriptionBn;
    data['short_description_hi'] = shortDescriptionHi;
    data['short_description_ar'] = shortDescriptionAr;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
