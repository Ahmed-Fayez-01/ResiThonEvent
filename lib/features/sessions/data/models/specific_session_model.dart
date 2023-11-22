class SpecificSessionModel {
  bool? status;
  Data? data;
  String? message;


  SpecificSessionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
  bool? session_expire;
  bool? chat_expire;
  bool? is_session;
  bool? session_started;
  bool? can_start_take_attend;
  bool? end_take_attend;
  bool? has_rate;
  bool? is_arrived;
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
    is_session = json['is_session'];
    session_started = json['session_started'];
    chat_expire = json['chat_expire'];
    description = json['description'];
    can_start_take_attend = json['can_start_take_attend'];
    end_take_attend = json['end_take_attend'];
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