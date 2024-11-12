class SubscriptionVideoAccessModel {
  int? code;
  String? status;
  String? message;
  Data? data;

  SubscriptionVideoAccessModel(
      {this.code, this.status, this.message, this.data});

  SubscriptionVideoAccessModel.fromJson(Map<String, dynamic> json) {
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
  bool? accessGranted;

  Data({this.accessGranted});

  Data.fromJson(Map<String, dynamic> json) {
    accessGranted = json['accessGranted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessGranted'] = accessGranted;
    return data;
  }
}
