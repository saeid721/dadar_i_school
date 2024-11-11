class LogInModel {
  int? code;
  String? status;
  String? message;
  Data? data;

  LogInModel({this.code, this.status, this.message, this.data});

  LogInModel.fromJson(Map<String, dynamic> json) {
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
  Token? token;
  Subscriber? subscriber;

  Data({this.token, this.subscriber});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    subscriber = json['subscriber'] != null
        ? Subscriber.fromJson(json['subscriber'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (token != null) {
      data['token'] = token!.toJson();
    }
    if (subscriber != null) {
      data['subscriber'] = subscriber!.toJson();
    }
    return data;
  }
}

class Token {
  String? access;
  String? refresh;

  Token({this.access, this.refresh});

  Token.fromJson(Map<String, dynamic> json) {
    access = json['access'];
    refresh = json['refresh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access'] = access;
    data['refresh'] = refresh;
    return data;
  }
}

class Subscriber {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? profile;
  int? subscriptionId;

  Subscriber(
      {this.id,
        this.firstName,
        this.lastName,
        this.phone,
        this.email,
        this.profile,
        this.subscriptionId});

  Subscriber.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    profile = json['profile'];
    subscriptionId = json['subscription_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['profile'] = profile;
    data['subscription_id'] = subscriptionId;
    return data;
  }
}
