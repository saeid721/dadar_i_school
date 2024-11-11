class SubscriptionPlanListModel {
  int? code;
  String? status;
  String? message;
  List<SubscriptionPlanListData>? data;

  SubscriptionPlanListModel({this.code, this.status, this.message, this.data});

  SubscriptionPlanListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SubscriptionPlanListData>[];
      json['data'].forEach((v) {
        data!.add(SubscriptionPlanListData.fromJson(v));
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

class SubscriptionPlanListData {
  int? id;
  String? name;
  String? nameBn;
  String? nameHi;
  String? nameAr;
  String? description;
  String? descriptionBn;
  String? descriptionHi;
  String? descriptionAr;
  double? price;
  String? durationType;
  int? duration;
  int? deviceLimit;
  bool? status;
  String? createdAt;
  String? updatedAt;

  SubscriptionPlanListData(
      {this.id,
        this.name,
        this.nameBn,
        this.nameHi,
        this.nameAr,
        this.description,
        this.descriptionBn,
        this.descriptionHi,
        this.descriptionAr,
        this.price,
        this.durationType,
        this.duration,
        this.deviceLimit,
        this.status,
        this.createdAt,
        this.updatedAt});

  SubscriptionPlanListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionBn = json['description_bn'];
    descriptionHi = json['description_hi'];
    descriptionAr = json['description_ar'];
    price = json['price'];
    durationType = json['duration_type'];
    duration = json['duration'];
    deviceLimit = json['device_limit'];
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
    data['description'] = description;
    data['description_bn'] = descriptionBn;
    data['description_hi'] = descriptionHi;
    data['description_ar'] = descriptionAr;
    data['price'] = price;
    data['duration_type'] = durationType;
    data['duration'] = duration;
    data['device_limit'] = deviceLimit;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
