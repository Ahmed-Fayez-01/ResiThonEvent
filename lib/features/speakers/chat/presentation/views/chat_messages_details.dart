import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/features/speakers/chat/presentation/views/widgets/chat_messages_details_body.dart';

import '../../../../../core/shared_widgets/no_internet_widget.dart';
import '../../../../../core/utils/services/local_services/cache_helper.dart';

class ChatMessagesDetails extends StatelessWidget {
  const ChatMessagesDetails(
      {Key? key,
      required this.name,
      required this.image,
      required this.id,
      required this.sessionId,
      required this.lastMsgNumber,
      required this.lastMsg})
      : super(key: key);
  final String name;
  final String image;
  final int id;
  final int sessionId;
  final dynamic lastMsgNumber;
  final String? lastMsg;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        FirebaseFirestore.instance.collection('chats').doc("privateChats").update({
          "$id${CacheHelper.getData(key: "id")}$sessionId.unReadMessageNumber":0
        });
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: MediaQuery.of(context).size.height * .016,
              color: Colors.black,
            ),
            onPressed: () {
              FirebaseFirestore.instance.collection('chats').doc("privateChats").update({
                "$id${CacheHelper.getData(key: "id")}$sessionId.unReadMessageNumber":0
              });
              Navigator.pop(context);


            },
          ),
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            // <-- SEE HERE
            statusBarIconBrightness: Brightness.dark,
            //<-- For Android SEE HERE (dark icons)
            systemNavigationBarColor: Color(0x33DCDCDC),
            statusBarBrightness:
                Brightness.light, //<-- For iOS SEE HERE (dark icons)
          ),
          title: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .035,
                width: MediaQuery.of(context).size.height * .035,
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withOpacity(.2),
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * .0175,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * .0175,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(
                            value: downloadProgress.progress),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(
                width: AppConstants.width10(context),
              ),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: MediaQuery.of(context).size.height * .018,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff323232)),
                ),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body:  ChatMessagesDetailsBody(
                chatType: 0,
                sessionId: sessionId,
                reciverId: id,
              )
      ),
    );
  }
}
