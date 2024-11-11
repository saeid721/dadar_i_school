class SubscriberListModel {
  int? code;
  String? status;
  String? message;
  List<SubscriberListData>? data;

  SubscriberListModel({this.code, this.status, this.message, this.data});

  SubscriberListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SubscriberListData>[];
      json['data'].forEach((v) {
        data!.add(SubscriberListData.fromJson(v));
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

class SubscriberListData {
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

  SubscriberListData(
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

  SubscriberListData.fromJson(Map<String, dynamic> json) {
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
