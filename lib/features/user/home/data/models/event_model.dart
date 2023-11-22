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
  int? sessionExpireAt;
  int? chatExpireAt;
  int? takeAttendBefore;
  int? stopTakeAttendBefore;
  List<Videos>? videos;


  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    place = json['place'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    image = json['image'];
    sessionExpireAt = json['session_expire_at'];
    takeAttendBefore = json['take_attend_before'];
    stopTakeAttendBefore = json['stop_take_attend_before'];
    chatExpireAt = json['chat_expire_at'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(Videos.fromJson(v));
      });
    }
  }

}

class Videos {
  int? id;
  String? date;
  String? path;

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    path = json['path'];
  }

}