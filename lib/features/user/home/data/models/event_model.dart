class EventModel {
  bool? status;
  Data? data;
  String? message;


  EventModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
  }

}

class Data {
  String? name;
  String? place;
  String? startDate;
  String? endDate;
  String? image;
  int? session_expire_at;
  int? chat_expire_at;


  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    place = json['place'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    image = json['image'];
    session_expire_at = json['session_expire_at'];
    chat_expire_at = json['chat_expire_at'];
  }

}