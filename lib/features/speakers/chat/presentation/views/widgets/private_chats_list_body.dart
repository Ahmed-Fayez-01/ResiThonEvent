import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/features/speakers/chat/data/models/all_users_list_model.dart';

 import '../../../../../../core/utils/constants.dart';
import '../chat_messages_details.dart';
import 'chats_list_body_item.dart';

class PrivateChatsListBody extends StatelessWidget {
  const PrivateChatsListBody({Key? key, required this.allUsersListInChatModel, required this.sessionId}) : super(key: key);
  final AllUsersListInChatModel allUsersListInChatModel;
  final int sessionId;
  @override
  Widget build(BuildContext context) {
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
  }
}
