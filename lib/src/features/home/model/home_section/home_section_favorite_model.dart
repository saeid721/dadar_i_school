class HomeSectionFavoriteModel {
  int? code;
  String? status;
  String? message;
  List<HomeSectionFavoriteData>? data;

  HomeSectionFavoriteModel({this.code, this.status, this.message, this.data});

  HomeSectionFavoriteModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HomeSectionFavoriteData>[];
      json['data'].forEach((v) {
        data!.add(HomeSectionFavoriteData.fromJson(v));
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

class HomeSectionFavoriteData {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? image;
  bool? status;
  String? createdAt;
  String? updatedAt;
  String? type;

  HomeSectionFavoriteData(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.type});

  HomeSectionFavoriteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_bn'] = nameBn;
    data['name_hi'] = nameHi;
    data['name_ar'] = nameAr;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['type'] = type;
    return data;
  }
}
