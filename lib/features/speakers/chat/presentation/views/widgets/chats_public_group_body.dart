import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:resithon_event/features/speakers/chat/presentation/views/widgets/speaker_public_chat_view.dart';

import '../../../../../../core/utils/colors/colors.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../data/models/all_users_list_model.dart';

class ChatsPublicGroupBody extends StatelessWidget {
  const ChatsPublicGroupBody({Key? key, required this.sessionId, required this.name, required this.allUsersListInChatModel, required this.groupImage}) : super(key: key);
  final int sessionId;
  final String name  ;
  final String groupImage  ;
  final AllUsersListInChatModel allUsersListInChatModel;
  @override
  Widget build(BuildContext context) {
    var list = List<Widget>.generate(allUsersListInChatModel.data!.length,
          (i) => Container(
        height: MediaQuery.of(context).size.height * .03,
        width: MediaQuery.of(context).size.height * .03,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height * .03,
          ),
          color: Colors.grey[300],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height * .03,
          ),
          child: CachedNetworkImage(
            imageUrl: allUsersListInChatModel.data![i].image!,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * .07,
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.greyColor,
                )),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chats').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        final List<Map<String, dynamic>> data = snapshot.data!.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return   SpeakerPublicChatView(
                groupName: "$name public Group",
                groupImage: groupImage,
                sessionId: sessionId,

              );
            }));
            // GoRouter.of(context).push("/speakerPublicChatView" , extra: {
            //   "groupImage": "image_url_here",
            //   "groupName": "Group Name Here",
            // } );
          },
          child: Container(
            padding: EdgeInsets.all(AppConstants.height5(context)),
            height: AppConstants.height55(context),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.height*.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.06),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.06),
                      child:   CachedNetworkImage(
                        imageUrl: groupImage,
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            CircularProgressIndicator(value: downloadProgress.progress),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      )),
                ),
                SizedBox(
                  width: AppConstants.width10(context),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlutterImageStack.widgets(
                        showTotalCount: true,
                        totalCount: list.length,
                        itemRadius: MediaQuery.of(context).size.height*.025,
                        // Radius of each images
                        itemCount: 2,
                        // Maximum number of images to be shown in stack
                        itemBorderWidth: 0,
                        extraCountTextStyle:  TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height*.014,
                        ),
                        backgroundColor: Colors.black,
                        children: list,
                        // Border width around the images
                      ),
                      SizedBox(height: AppConstants.height10(context),),
                      Text(
                        data.isNotEmpty?"${data[0]["message"]}": "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontSize: AppConstants.sp10(context),
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppConstants.width20(context),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "5 m",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w400,
                    //     fontFamily: "Poppins",
                    //     fontSize: AppConstants.sp10(context),
                    //     color: AppColors.greyColor,
                    //   ),
                    // ),
                    SizedBox(height: AppConstants.height10(context),),
                    if(data[0]["unReadMessageNumber"]!=0)
                    Container(
                      height: MediaQuery.of(context).size.height*.025,
                      width: MediaQuery.of(context).size.height*.025,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.0125,),
                      ),
                      child: Center(
                        child: Text(
                          data.isNotEmpty?"${data[0]["unReadMessageNumber"]}": "",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontSize: AppConstants.sp10(context),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
