class SubscriptionEnrollMeModel {
  int? code;
  String? status;
  String? message;
  SubscriptionEnrollMeData? data;

  SubscriptionEnrollMeModel({this.code, this.status, this.message, this.data});

  SubscriptionEnrollMeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SubscriptionEnrollMeData.fromJson(json['data']) : null;
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

class SubscriptionEnrollMeData {
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

  SubscriptionEnrollMeData(
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
        this.updatedAt});

  SubscriptionEnrollMeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subscriberId = json['subscriber_id'];
    planId = json['plan_id'];
    endDate = json['end_date'];
    note = json['note'];
    isOfferApplied = json['is_offer_applied'];
    grandTotal = json['grand_total'];
    paymentStatus = json['payment_status'];
    paymentMethod = json['payment_method'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}
