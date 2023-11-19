class SpeakersChatMessageModel{
  final String? message;
  final int? sessionId;
  final int? senderId;
  final int? reciverId;
  final int? chatType;

  SpeakersChatMessageModel({required this.message, required this.sessionId, required this.senderId, required this.reciverId, required this.chatType});

}