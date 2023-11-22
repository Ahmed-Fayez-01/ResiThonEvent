 import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:resithon_event/core/utils/services/remote_services/api_service.dart';
// import 'package:pusher_client/pusher_client.dart';

import '../../data/models/all_users_list_model.dart';
import '../../data/models/message_model.dart';
import '../../data/models/send_message_to_firebase_model.dart';
import '../../data/models/speakers_chat_message_model.dart';
import '../../data/repo/speaker_chat_repo.dart';

part 'speaker_chat_state.dart';

class SpeakerChatCubit extends Cubit<SpeakerChatState> {
  SpeakerChatCubit(this.speakersChatRepo) : super(SpeakerChatInitial());
  SpeakersChatRepo? speakersChatRepo;
  static SpeakerChatCubit get(context) => BlocProvider.of(context);





  bool isActiveValue = true;
  toggleChats(newIsActiveValue)
  {
    isActiveValue = newIsActiveValue;
    emit(ToggleChatsState());
  }




  Future<void> speakerChatSendMessage({int? sessionId,
    int? senderId,
    int? reciverId,
    int? chatType,
    String? msg
  }) async {
   // emit(UserEditProfileLoadingState());
    var result = await speakersChatRepo!.speakersChatSendMessage(
      chatType: chatType,
      msg: msg,
      reciverId:reciverId ,
      senderId: senderId,
      sessionId: sessionId,
    );
    return result.fold((failure) {
      emit(SendMessageErrorState(failure));
    }, (data) {
      emit(SendMessageSuccessState());
    });
  }



 PusherClient? pusher;
 Channel? channel;


  void connectToServer({
    required int type,
    required int sessionId,
}) async {
    PusherOptions options = PusherOptions(
      host: "http://resithon_event.site/api/",
      wsPort: 443,
      cluster: "ap1",
      encrypted: true,
      auth: PusherAuth(
        'http://resithon_event.site/api/',
        headers: {
         'code': '76746',
         "Accept": "application/json",
        },
      ),
    );

    pusher = PusherClient(
      "70795afe6e45b4d29190",
      options,
      autoConnect: true,
      enableLogging: true,
    );

    await pusher?.connect().then((value) {
      debugPrint("------- connectToServer done -------");
      channel = pusher?.subscribe("chat-channel");
      channel?.bind('chat-event', (PusherEvent? event) {
       getAllMessages(
         type: type,
         sessionId: sessionId,
       );
        print('Received event: ${event?.eventName}, data: ${event?.data}');
      });
     getNewMessages(
       type: type,
       sessionId: sessionId,
     );
      print("2222222222222222222222");
      emit(ConnectSuccess());
      pusher?.onConnectionStateChange((state) {
        debugPrint(
            "previousState: ${state?.previousState}, currentState: ${state?.currentState}");
      });
    });
    pusher?.onConnectionError((error) {
      debugPrint("error in chat ${error.toString()}");
      emit(ConnectError());
    });

  }

  void getNewMessages({
    required int type,
    required int sessionId,
}) {
    channel?.bind("App\\Events\\chat-event", (PusherEvent? event) {
      print(event?.data);
      var messageData = json.decode("${event?.data}");
      String message = messageData['message'];
      print(message);
      print("9999999999999999999");
     getAllMessages(
       type: type,
       sessionId: sessionId,
     );
      FocusManager.instance.primaryFocus?.unfocus();
      // print('Received Pusher message: $message');
      print(event?.data.toString());
    }).onError((error, stackTrace) {
      debugPrint("------- getNewMessage error ${error.toString()}-------");
      emit(GetMessagesError2());
    });
  }


  var messageController = TextEditingController();
  int unReadMessageNumberInCubit = 0;
  void sendMessage2({
    required String message,
    required int senderId,
    int? receiverId,
    required int type,
    required int sessionId,
}) async {
    // String proId = SharedPreferencesHelper.getData(key: "proId");
    // channel?.trigger("my-chat$proId", {"name": messageCon.text});
    ApiService(Dio()).postData(
      sendCode: true,
      data: {
        "sender_id" : senderId,
        if(receiverId != null)
        "receiver_id" :receiverId,
        "message": message,
        "type": type,
        "session_id":sessionId,
      },
      endPoint: '/send-message',
    ).then((value) {
      debugPrint("------- sendMessage done -------");
      print(value.data);
      unReadMessageNumberInCubit++;
      sendMessageToFirebase(SendMessageToFirebaseModel(
          message: message,
          sessionId: sessionId,
          senderId: senderId,
          reciverId: receiverId,
          chatType: type,
        unReadMessageNumber: unReadMessageNumberInCubit,
      ),
      );
      messageController.clear();
      emit(SendMessageSuccessState());

    }).catchError((error) {
      if (error is DioError && error.response?.statusCode == 403) {
        final data = error.response?.data;
        final message = data['message'];
        // final errors = Map<String, List<String>>.from(data['errors']);
         print(message);
      }

      print(error.toString());
      debugPrint("------- sendMessage error -------");
      emit(SendMessageErrorState(error.toString()));
    });
   // debugPrint(messageCon.text);
  }

  // final scrollController = ScrollController();
  GetMessageModel? getMessageModel;
  List<Data> allChatMessages = [];
  getAllMessages({
    required int type,
    required int sessionId,
}) {
    emit(GetAllMessagesLoadingState());
    ApiService(Dio()).get(
        sendCode: true,
     endPoint: "/get-messages?type=$type&session_id=$sessionId"
    ).then((value) {
      getMessageModel = GetMessageModel.fromJson(value.data);
      allChatMessages = getMessageModel?.data ?? [];
      print(value.data);
      print("get all messages done ");
      emit(GetAllMessagesSuccessState());
      // Future.delayed(const Duration(seconds: 3)).then((value) {
      //   FocusManager.instance.primaryFocus?.unfocus();
      //    scrollController.jumpTo(
      //    scrollController.position.maxScrollExtent,
      //     // duration:const Duration(seconds: 1),
      //     // curve: Curves.fastOutSlowIn,
      //   );
      // });
    }).catchError((error) {
      if (error is DioError && error.response?.statusCode == 403) {
        final data = error.response?.data;
        final message = data['message'];
        // final errors = Map<String, List<String>>.from(data['errors']);
        print(message);
      }
      print("error in get all messgaes ${error.toString()}");
      emit(GetAllMessagesErrorState());
    });
  }






  Future<void> getAllUsersInChatList({required int sessionId}) async {
    emit(GetAllUsersInChatLoadingState());

    if (speakersChatRepo != null) {
      var result = await speakersChatRepo!.getAllUsersInChat(sessionId: sessionId);
      return result.fold(
            (failure) {
          print("error mostafa");
          emit(GetAllUsersInChatErrorState(failure));
          print(failure);
        },
            (data) {
          print(data);
          emit(GetAllUsersInChatSuccessState(data));
        },
      );
    } else {
      print("speakersChatRepo is null");
      // Handle the case when speakersChatRepo is null
    }
  }


 // User? user;
  Stream? messageStream;
  SendMessageToFirebaseModel? sendMessageToFirebaseModel;
  CollectionReference messagesCollection = FirebaseFirestore.instance.collection("chats") ;
  sendMessageToFirebase(SendMessageToFirebaseModel sendMessageToFirebaseModel)
  async {
    emit(SendMessageToFirebaseLoadingState());
    print("firebase"*10);
    try {
      DocumentSnapshot messageSnapshot = await messagesCollection.doc("messageId").get();
      if (messageSnapshot.exists) {
        await messagesCollection.doc("messageId").update(sendMessageToFirebaseModel.toMap());
        print('Message updated successfully');

        emit(SendMessageToFirebaseSuccessState());
      } else {
        await messagesCollection.doc("messageId").set(sendMessageToFirebaseModel.toMap());
        print('Message created successfully');

        emit(SendMessageToFirebaseSuccessState());
      }
    } catch (e) {

      print('Error sending message: $e');
      emit(SendMessageToFirebaseErrorState());
    }
    // ref.add(sendMessageToFirebaseModel.toMap()).then((value)
    // {
    //   print(value);
    //   print("firebase success"*10);
    //   print("------------------------");
    //   print(ref.id);
    //   print("------------------------");
    //   print(sendMessageToFirebaseModel.sessionId);
    //   print("------------------------");
    //   print(sendMessageToFirebaseModel.senderId);
    //   print("------------------------");
    //   print(sendMessageToFirebaseModel.message);
    //   print("------------------------");
    //   emit(SendMessageToFirebaseSuccessState());
    // }).catchError((error)
    // {
    //   print("firebase error "*10);
    //   print("error in send message cubit ${error.toString()}");
    //   emit(SendMessageToFirebaseErrorState());
    // });

  }


}
