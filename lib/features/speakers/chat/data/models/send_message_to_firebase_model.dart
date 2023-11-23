
class SendMessageToFirebaseModel
{
  final String? message;
  final int? sessionId;
  final int? senderId;
  final int? reciverId;
  final int? chatType;
  final int? unReadMessageNumber;

  SendMessageToFirebaseModel({required this.unReadMessageNumber , required this.message, required this.sessionId, required this.senderId, required this.reciverId, required this.chatType});


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

      };
  }

}