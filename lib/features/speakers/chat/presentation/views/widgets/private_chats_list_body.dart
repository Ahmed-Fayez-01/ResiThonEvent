import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/features/speakers/chat/data/models/all_users_list_model.dart';
import 'package:resithon_event/features/speakers/chat/data/models/send_message_to_firebase_model.dart';

 import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/services/local_services/cache_helper.dart';
import '../chat_messages_details.dart';
import 'chats_list_body_item.dart';

class PrivateChatsListBody extends StatelessWidget {
  const PrivateChatsListBody({Key? key, required this.allUsersListInChatModel, required this.sessionId, }) : super(key: key);
  final AllUsersListInChatModel allUsersListInChatModel;
  final int sessionId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chats').snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }
     // List<SendMessageToFirebaseModel>? chatDocuments = snapshot.data!.docs.cast<SendMessageToFirebaseModel>();
     // var unReadMessageNumber = chatDocuments[0].unReadMessageNumber;
     // var message = chatDocuments[0].message;
     // print(unReadMessageNumber);
     // print(message);
      final List<Map<String, dynamic>> data = snapshot.data!.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      return Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) {
            print("${allUsersListInChatModel.data![index].id!}");
            return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ChatMessagesDetails(
                      name:  allUsersListInChatModel.data![index].name.toString(),
                      id:    allUsersListInChatModel.data![index].id!,
                      image: allUsersListInChatModel.data![index].image.toString(),
                      sessionId:sessionId,
                      lastMsg:  data[0]["message"]!=null? "${data[0]["${allUsersListInChatModel.data![index].id!}${CacheHelper.getData(key: "id")}$sessionId"]["message"]}" : "",
                      lastMsgNumber: data[0]["unReadMessageNumber"]!=null? "${data[0]["${allUsersListInChatModel.data![index].id!}${CacheHelper.getData(key: "id")}$sessionId"]["unReadMessageNumber"]}" : "0",

                    );
                  }));
                },
                child:   ChatsListBodyItem(
                  name:  allUsersListInChatModel.data![index].name.toString(),
                  id:    allUsersListInChatModel.data![index].id!,
                  image: allUsersListInChatModel.data![index].image.toString(),
                  lastMessageFromFirebase:
                  data[0]["${allUsersListInChatModel.data![index].id!}${CacheHelper.getData(key: "id")}$sessionId"]!=null ?
                  data[0]["${allUsersListInChatModel.data![index].id!}${CacheHelper.getData(key: "id")}$sessionId"]["message"] != null? "${data[0]["${allUsersListInChatModel.data![index].id!}${CacheHelper.getData(key: "id")}$sessionId"]["message"]}" : "" : "No Messages",
                  lastMessageNumberFromFirebase:
                  data[0]["${allUsersListInChatModel.data![index].id!}${CacheHelper.getData(key: "id")}$sessionId"]!=null ?
                  data[0]["${allUsersListInChatModel.data![index].id!}${CacheHelper.getData(key: "id")}$sessionId"]["unReadMessageNumber"]!=null? "${data[0]["${allUsersListInChatModel.data![index].id!}${CacheHelper.getData(key: "id")}$sessionId"]["unReadMessageNumber"]}" : "0": "0",
                  // time: data.isNotEmpty? "${data[0]["timeOfDay"]}" : "",
                ));
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: AppConstants.height10(context),
            );
          },
          itemCount: allUsersListInChatModel.data!.length,
        ),
      );
    },
    );
  }
}
