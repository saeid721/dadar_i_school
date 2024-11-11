class SubscriptionModel {
  int? code;
  String? status;
  String? message;
  List<SubscriptionData>? data;

  SubscriptionModel({this.code, this.status, this.message, this.data});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SubscriptionData>[];
      json['data'].forEach((v) {
        data!.add(SubscriptionData.fromJson(v));
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

class SubscriptionData {
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

  SubscriptionData(
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

  SubscriptionData.fromJson(Map<String, dynamic> json) {
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
