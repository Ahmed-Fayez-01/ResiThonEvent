import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/features/speakers/chat/data/models/all_users_list_model.dart';
import 'package:resithon_event/features/speakers/chat/data/models/send_message_to_firebase_model.dart';

 import '../../../../../../core/utils/constants.dart';
import '../chat_messages_details.dart';
import 'chats_list_body_item.dart';

class PrivateChatsListBody extends StatelessWidget {
  const PrivateChatsListBody({Key? key, required this.allUsersListInChatModel, required this.sessionId}) : super(key: key);
  final AllUsersListInChatModel allUsersListInChatModel;
  final int sessionId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chat').snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }
      List<SendMessageToFirebaseModel>? chatDocuments = snapshot.data!.docs.cast<SendMessageToFirebaseModel>();
      var unReadMessageNumber = chatDocuments[0].unReadMessageNumber;
      var message = chatDocuments[0].message;
      print(unReadMessageNumber);
      print(message);
      return Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ChatMessagesDetails(
                      name:  allUsersListInChatModel.data![index].name.toString(),
                      id:    allUsersListInChatModel.data![index].id!,
                      image: allUsersListInChatModel.data![index].image.toString(),
                      sessionId:sessionId,
                      lastMsg: message.toString(),
                      lastMsgNumber: unReadMessageNumber!,
                    );
                  }));
                  // GoRouter.of(context).push("/chatMessagesDetails");
                },
                child:   ChatsListBodyItem(
                  name:  allUsersListInChatModel.data![index].name.toString(),
                  id:    allUsersListInChatModel.data![index].id!,
                  image: allUsersListInChatModel.data![index].image.toString(),
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
