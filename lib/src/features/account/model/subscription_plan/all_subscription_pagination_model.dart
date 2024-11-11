class AllSubscriptionPaginationModel {
  int? code;
  String? status;
  String? message;
  PaginationData? data;

  AllSubscriptionPaginationModel(
      {this.code, this.status, this.message, this.data});

  AllSubscriptionPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? PaginationData.fromJson(json['data']) : null;
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

class PaginationData {
  List<Result>? result;
  Pagination? pagination;

  PaginationData({this.result, this.pagination});

  PaginationData.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Result {
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
  Subscriber? subscriber;

  Result(
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
        this.plan,
        this.subscriber});

  Result.fromJson(Map<String, dynamic> json) {
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
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
    subscriber = json['subscriber'] != null
        ? Subscriber.fromJson(json['subscriber'])
        : null;
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
    if (subscriber != null) {
      data['subscriber'] = subscriber!.toJson();
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

class Subscriber {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  int? planId;
  String? dateOfBirth;
  String? profile;
  bool? isSocial;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Subscriber(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.address,
        this.planId,
        this.dateOfBirth,
        this.profile,
        this.isSocial,
        this.status,
        this.createdAt,
        this.updatedAt});

  Subscriber.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    planId = json['plan_id'];
    dateOfBirth = json['date_of_birth'];
    profile = json['profile'];
    isSocial = json['is_social'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['plan_id'] = planId;
    data['date_of_birth'] = dateOfBirth;
    data['profile'] = profile;
    data['is_social'] = isSocial;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Pagination {
  int? total;
  int? totalPage;
  int? currentPage;
  int? pageLimit;
  int? nextPage;

  Pagination(
      {this.total,
        this.totalPage,
        this.currentPage,
        this.pageLimit,
        this.nextPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalPage = json['total_page'];
    currentPage = json['current_page'];
    pageLimit = json['page_limit'];
    nextPage = json['next_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['total_page'] = totalPage;
    data['current_page'] = currentPage;
    data['page_limit'] = pageLimit;
    data['next_page'] = nextPage;
    return data;
  }
}
