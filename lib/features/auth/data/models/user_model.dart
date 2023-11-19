class UserModel {
  bool? status;
  Data? data;
  String? message;


  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
  }

}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? role;
  String? wantTo;
  bool? canRate;
  String? iCan;
  String? code;
  String? event_start_date;
  String? event_end_date;
  String? comment;
  String? points;
  String? qr;
  bool? vip;
  String? image;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    wantTo = json['want_to'];
    canRate = json['can_rate'];
    event_start_date = json['event_start_date'];
    event_end_date = json['event_end_date'];
    iCan = json['i_can'];
    code = json['code'];
    comment = json['comment'];
    points = json['points'];
    qr = json['qr'];
    vip = json['vip'];
    image = json['image'];
  }
}