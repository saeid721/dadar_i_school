class GenresListModel {
  int? code;
  String? status;
  String? message;
  List<GenresListData>? data;

  GenresListModel({this.code, this.status, this.message, this.data});

  GenresListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GenresListData>[];
      json['data'].forEach((v) {
        data!.add(GenresListData.fromJson(v));
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

class GenresListData {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? slug;
  String? thumbnail;
  bool? status;
  String? createdAt;
  String? updatedAt;

  GenresListData(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.slug,
        this.thumbnail,
        this.status,
        this.createdAt,
        this.updatedAt});

  GenresListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
    slug = json['slug'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_bn'] = nameBn;
    data['name_hi'] = nameHi;
    data['name_ar'] = nameAr;
    data['slug'] = slug;
    data['thumbnail'] = thumbnail;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
