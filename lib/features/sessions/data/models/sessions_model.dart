class SessionsModel {
  bool? status;
  List<Data>? data;
  String? message;

  SessionsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
    message = json['message'];
  }


}

class Data {
  int? id;
  int? type;
  String? name;
  String? topics;
  String? venue;
  String? totalCount;
  int? count;
  bool? attend;
  bool? reservation_expire;
  bool? is_session;
  bool? session_expire;
  bool? chat_expire;
  bool? has_rate;
  bool? is_arrived;
  bool? can_start_take_attend;
  bool? end_take_attend;
  bool? session_started;
  String? description;
  String? speaker;
  String? date;
  String? startTime;
  String? endTime;
  String? image;
  String? speaker_image;
  String? status;
  List<Participants>? participants;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    topics = json['topics'];
    venue = json['venue'];
    totalCount = json['total_count'];
    count = json['count'];
    attend = json['attend'];
    reservation_expire = json['reservation_expire'];
    session_expire = json['session_expire'];
    session_started = json['session_started'];
    chat_expire = json['chat_expire'];
    is_session = json['is_session'];
    can_start_take_attend = json['can_start_take_attend'];
    end_take_attend = json['end_take_attend'];
    description = json['description'];
    has_rate = json['has_rate'];
    is_arrived = json['is_arrived'];
    speaker = json['speaker'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    image = json['image'];
    speaker_image = json['speaker_image'];
    status = json['status'];
    if (json['participants'] != null) {
      participants = <Participants>[];
      json['participants'].forEach((v) {
        participants!.add( Participants.fromJson(v));
      });
    }
  }

}
class Participants {
  int? id;
  String? name;
  String? image;


  Participants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

}