class NotificationsModel {
  bool? status;
  List<Data>? data;
  String? message;

  NotificationsModel({this.status, this.data, this.message});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(  Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['status'] =  status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] =  message;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? message;
  String? date;

  Data({this.id, this.title, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['message'] = message;
    data['date'] = date;
    return data;
  }
}
