class SubscriptionListModel {
  int? code;
  String? status;
  String? message;
  List<Data>? data;

  SubscriptionListModel({this.code, this.status, this.message, this.data});

  SubscriptionListModel.fromJson(Map<String, dynamic> json) {
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
  int? subscriberId;
  int? planId;
  String? endDate;
  String? note;
  bool? isOfferApplied;
  double? grandTotal;
  String? paymentStatus;
  String? paymentMethod;
  String? status;
  String? createdAt;
  String? updatedAt;
  Plan? plan;

  Data(
      {this.id,
        this.subscriberId,
        this.planId,
        this.endDate,
        this.note,
        this.isOfferApplied,
        this.grandTotal,
        this.paymentStatus,
        this.paymentMethod,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.plan});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subscriberId = json['subscriber_id'];
    planId = json['plan_id'];
    endDate = json['end_date'];
    note = json['note'];
    isOfferApplied = json['is_offer_applied'];
    grandTotal = json['grand_total'].toDouble();
    paymentStatus = json['payment_status'];
    paymentMethod = json['payment_method'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subscriber_id'] = subscriberId;
    data['plan_id'] = planId;
    data['end_date'] = endDate;
    data['note'] = note;
    data['is_offer_applied'] = isOfferApplied;
    data['grand_total'] = grandTotal;
    data['payment_status'] = paymentStatus;
    data['payment_method'] = paymentMethod;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    return data;
  }
}

class Plan {
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

  Plan(
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

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameBn = json['name_bn'];
    nameHi = json['name_hi'];
    nameAr = json['name_ar'];
    description = json['description'];
    descriptionBn = json['description_bn'];
    descriptionHi = json['description_hi'];
    descriptionAr = json['description_ar'];
    price = json['price'].toDouble();
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
