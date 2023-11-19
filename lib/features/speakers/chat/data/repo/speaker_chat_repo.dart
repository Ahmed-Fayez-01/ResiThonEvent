

import 'package:dartz/dartz.dart';
import 'package:resithon_event/features/speakers/chat/data/models/all_users_list_model.dart';

abstract class SpeakersChatRepo{
  Future<Either<String,dynamic>> speakersChatSendMessage({int? sessionId , int? senderId , int? reciverId, int? chatType, String? msg,} );
  Future<Either<String,AllUsersListInChatModel>> getAllUsersInChat({int? sessionId , } );

}