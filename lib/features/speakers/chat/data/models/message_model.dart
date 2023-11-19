class GetMessageModel {
  bool? status;
  List<Data>? data;
  String? message;

  GetMessageModel({this.status, this.data, this.message});

  GetMessageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? senderId;
  String? senderName;
  String? senderImage;
  String? receiverId;
  String? receiverName;
  String? receiverImage;
  int? type;
  int? sessionId;
  String? message;

  Data(
      {this.senderId,
        this.senderName,
        this.senderImage,
        this.receiverId,
        this.receiverName,
        this.receiverImage,
        this.type,
        this.sessionId,
        this.message});

  Data.fromJson(Map<String, dynamic> json) {
    senderId = json['sender_id'];
    senderName = json['sender_name'];
    senderImage = json['sender_image'];
    receiverId = json['receiver_id'];
    receiverName = json['receiver_name'];
    receiverImage = json['receiver_image'];
    type = json['type'];
    sessionId = json['session_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender_id'] = this.senderId;
    data['sender_name'] = this.senderName;
    data['sender_image'] = this.senderImage;
    data['receiver_id'] = this.receiverId;
    data['receiver_name'] = this.receiverName;
    data['receiver_image'] = this.receiverImage;
    data['type'] = this.type;
    data['session_id'] = this.sessionId;
    data['message'] = this.message;
    return data;
  }
}
