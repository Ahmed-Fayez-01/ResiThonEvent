import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:resithon_event/features/speakers/chat/presentation/views/widgets/speaker_public_chat_view.dart';

import '../../../../../../core/utils/colors/colors.dart';
import '../../../../../../core/utils/constants.dart';

class ChatsPublicGroupBody extends StatelessWidget {
  ChatsPublicGroupBody({Key? key, required this.sessionId, required this.name}) : super(key: key);
  final int sessionId;
  final String name  ;
  final List<Widget> _images = [
    const CircleAvatar(
      backgroundImage: AssetImage("assets/images/vip_food.png"),
      backgroundColor: Colors.grey,
    ),
    const CircleAvatar(
      backgroundImage: AssetImage("assets/images/vip_food.png"),
      backgroundColor: Colors.grey,
    ),
    const CircleAvatar(
      backgroundImage: AssetImage("assets/images/vip_food.png"),
      backgroundColor: Colors.grey,
    ),
    const CircleAvatar(
      backgroundImage: AssetImage("assets/images/vip_food.png"),
      backgroundColor: Colors.grey,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return   SpeakerPublicChatView(
            groupName: "$name public Group",
            groupImage: "assets/images/vip_food.png",
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
                  child: Image.asset(
                    "assets/images/vip_food.png",
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: AppConstants.width10(context),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterImageStack.widgets(
                  showTotalCount: true,
                  totalCount: 20,
                  itemRadius: MediaQuery.of(context).size.height*.025,
                  // Radius of each images
                  itemCount: 3,
                  // Maximum number of images to be shown in stack
                  itemBorderWidth: 0,
                  extraCountTextStyle:  TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height*.014,
                  ),
                  backgroundColor: Colors.black,
                  children: _images,
                  // Border width around the images
                ),
                SizedBox(height: AppConstants.height10(context),),
                Text(
                  "Hello All",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontSize: AppConstants.sp10(context),
                      color: AppColors.primaryColor),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "5 m",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    fontSize: AppConstants.sp10(context),
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(height: AppConstants.height10(context),),
                Container(
                  height: MediaQuery.of(context).size.height*.025,
                  width: MediaQuery.of(context).size.height*.025,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular( MediaQuery.of(context).size.height*.0125,),
                  ),
                  child: Center(
                    child: Text(
                      "2",
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
  }
}
