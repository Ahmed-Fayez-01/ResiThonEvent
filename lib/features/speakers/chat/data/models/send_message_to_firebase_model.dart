
import 'package:flutter/material.dart';

class SendMessageToFirebaseModel
{
  final String? message;
  final int? sessionId;
  final int? senderId;
  final int? reciverId;
  final int? chatType;
  final int? unReadMessageNumber;
  final TimeOfDay? timeOfDay;

  SendMessageToFirebaseModel( {required this.timeOfDay ,required this.unReadMessageNumber , required this.message, required this.sessionId, required this.senderId, required this.reciverId, required this.chatType});


  Map<String , dynamic> toMap()
  {
    return
      {
        "message":message,
        "sessionId":sessionId,
        "senderId":senderId,
        "reciverId":reciverId,
        "chatType":chatType,
        "unReadMessageNumber":unReadMessageNumber,
        "timeOfDay":timeOfDay,

      };
  }

}