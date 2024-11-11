class MovieTabViewIndustriesModel {
  int? code;
  String? status;
  String? message;
  List<Data>? data;

  MovieTabViewIndustriesModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  MovieTabViewIndustriesModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? country;
  String? countryBn;
  String? countryHi;
  String? countryAr;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.name, this.nameBn, this.nameHi, this.nameAr, this.country, this.countryBn, this.countryHi, this.countryAr, this.status, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
    country = json['country'];
    countryBn = json['country_bn'];
    countryHi = json['country_hi'];
    countryAr = json['country_ar'];
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
    data['country'] = country;
    data['country_bn'] = countryBn;
    data['country_hi'] = countryHi;
    data['country_ar'] = countryAr;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
