import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:resithon_event/features/speakers/chat/data/models/all_users_list_model.dart';
import 'package:resithon_event/features/speakers/chat/data/repo/speaker_chat_repo.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/services/remote_services/api_service.dart';
import '../../../../../core/utils/services/remote_services/endpoints.dart';

class SpeakersChatRepoImpl implements SpeakersChatRepo {
  final ApiService? apiService;

  SpeakersChatRepoImpl(this.apiService);

  @override
  Future<Either<String, dynamic>> speakersChatSendMessage(
      {
        int? sessionId,
      int? senderId,
      int? reciverId,
      int? chatType,
      String? msg}) {
    // TODO: implement speakersChat
    throw UnimplementedError();
  }

  @override
  Future<Either<String, AllUsersListInChatModel>> getAllUsersInChat({int? sessionId}) async {
    try {
      var response = await apiService!.get(
          endPoint: "${EndPoints.chatUsers}?session_id=$sessionId",
      sendCode: true,
      );
      var result=AllUsersListInChatModel.fromJson(response.data);
      return right(result);
    } catch(e)
    {
      if(e is DioException)
      {
        print(e);
        print("mostafa bahr");
        return left(ServerFailure.fromDioError(e).toString());
      }else{
        print(e);
        print("mostafa bahr");
        return left(ServerFailure(e.toString()).toString());
      }

    }
  }
}
