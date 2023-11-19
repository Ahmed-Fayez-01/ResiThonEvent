import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/core/shared_widgets/notification_widget.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/constants.dart';

import '../../../../../speakers/chat/presentation/views/chat_view.dart';

class UserHomeAppBar extends StatelessWidget {
  const UserHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          GestureDetector(
            onTap: (){
              Scaffold.of(context).openDrawer();
            },
            child: SvgPicture.asset(
             AssetData.menu,
              width: AppConstants.width20(context),
            ),
          ),
          const Spacer(),
          AppBarIconWidget(press: (){
            GoRouter.of(context).push("/notificationsViews");
          }, iconPath: AssetData.bell),
          SizedBox(width: AppConstants.width10(context),),
          AppBarIconWidget(press: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const SpeakerChatView(
                userType: "3",
              );
            }));
           // GoRouter.of(context).push("/speakerChatView");
          //  GoRouter.of(context).push("/userChatView");
          }, iconPath: AssetData.whiteChat),
        ],
      ),
    );
  }
}
