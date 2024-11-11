class RegistrationModel {
  int? code;
  String? status;
  String? message;
  Data? data;

  RegistrationModel({this.code, this.status, this.message, this.data});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  String? subscriptionId;
  String? dateOfBirth;
  String? profile;
  bool? isSocial;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.address,
        this.subscriptionId,
        this.dateOfBirth,
        this.profile,
        this.isSocial,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    subscriptionId = json['subscription_id'];
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
    data['subscription_id'] = subscriptionId;
    data['date_of_birth'] = dateOfBirth;
    data['profile'] = profile;
    data['is_social'] = isSocial;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
