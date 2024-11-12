class HomeSectionSingleBlogsModel {
  int? code;
  String? status;
  String? message;
  Data? data;

  HomeSectionSingleBlogsModel(
      {this.code, this.status, this.message, this.data});

  HomeSectionSingleBlogsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? slug;
  String? banner;
  String? shortDescription;
  String? shortDescriptionBn;
  String? shortDescriptionHi;
  String? shortDescriptionAr;
  String? description;
  String? descriptionBn;
  String? descriptionHi;
  String? descriptionAr;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.titleBn,
        this.titleHi,
        this.titleAr,
        this.slug,
        this.banner,
        this.shortDescription,
        this.shortDescriptionBn,
        this.shortDescriptionHi,
        this.shortDescriptionAr,
        this.description,
        this.descriptionBn,
        this.descriptionHi,
        this.descriptionAr,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleBn = json['title_bn'];
    titleHi = json['title_hi'];
    titleAr = json['title_ar'];
    slug = json['slug'];
    banner = json['banner'];
    shortDescription = json['short_description'];
    shortDescriptionBn = json['short_description_bn'];
    shortDescriptionHi = json['short_description_hi'];
    shortDescriptionAr = json['short_description_ar'];
    description = json['description'];
    descriptionBn = json['description_bn'];
    descriptionHi = json['description_hi'];
    descriptionAr = json['description_ar'];
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
    data['slug'] = slug;
    data['banner'] = banner;
    data['short_description'] = shortDescription;
    data['short_description_bn'] = shortDescriptionBn;
    data['short_description_hi'] = shortDescriptionHi;
    data['short_description_ar'] = shortDescriptionAr;
    data['description'] = description;
    data['description_bn'] = descriptionBn;
    data['description_hi'] = descriptionHi;
    data['description_ar'] = descriptionAr;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
