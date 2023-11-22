part of 'speaker_chat_cubit.dart';

@immutable
abstract class SpeakerChatState {}

class SpeakerChatInitial extends SpeakerChatState {}

class ToggleChatsState extends SpeakerChatState {}

class ConnectSuccess extends SpeakerChatState {}
class ConnectError extends SpeakerChatState {}
class GetMessagesError2 extends SpeakerChatState {}

class GetAllMessagesLoadingState extends SpeakerChatState {}
class GetAllMessagesSuccessState extends SpeakerChatState {

}
class GetAllMessagesErrorState extends SpeakerChatState {}

class SendMessageSuccessState extends SpeakerChatState {}
class SendMessageErrorState extends SpeakerChatState {
  final String errMessage;
  SendMessageErrorState(this.errMessage);
}


class GetAllUsersInChatLoadingState extends SpeakerChatState {}
class GetAllUsersInChatSuccessState extends SpeakerChatState {
  AllUsersListInChatModel allUsersListInChatModel;
  GetAllUsersInChatSuccessState(this.allUsersListInChatModel);
}
class GetAllUsersInChatErrorState extends SpeakerChatState {
  final String errMessage;
  GetAllUsersInChatErrorState(this.errMessage);
}


class SendMessageToFirebaseLoadingState extends SpeakerChatState{}
class SendMessageToFirebaseSuccessState extends SpeakerChatState{}
class SendMessageToFirebaseErrorState extends SpeakerChatState{}
