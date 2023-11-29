import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/core/shared_widgets/notification_widget.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:badges/badges.dart' as badges;
import 'package:resithon_event/features/notifications/presentation/view_models/notifications_cubit.dart';
import 'package:resithon_event/features/notifications/presentation/view_models/notifications_states.dart';
import '../../../../../../core/utils/services/local_services/cache_helper.dart';
import '../../../../chat/presentation/views/chat_view.dart';

class SpeakerHomeAppBar extends StatefulWidget {
  const SpeakerHomeAppBar({super.key});

  @override
  State<SpeakerHomeAppBar> createState() => _SpeakerHomeAppBarState();
}

class _SpeakerHomeAppBarState extends State<SpeakerHomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit,NotificationsStates>(builder: (context,state){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: SvgPicture.asset(
                AssetData.menu,
                width: AppConstants.width20(context),
              ),
            ),
            const Spacer(),
            int.parse(CacheHelper.getData(key: "newNotificationLength").toString())-int.parse(CacheHelper.getData(key: "oldNotificationLength").toString())==0?  AppBarIconWidget(press: (){
              setState(() {
                CacheHelper.saveData(key: "oldNotificationLength", value: CacheHelper.getData(key: "newNotificationLength"));
              });
              GoRouter.of(context).push("/notificationsViews");
            }, iconPath: AssetData.bell):
            badges.Badge(
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.black,
              ),
              badgeContent: Text(
                "${int.parse(CacheHelper.getData(key: "newNotificationLength").toString())-int.parse(CacheHelper.getData(key: "oldNotificationLength").toString())}",
                style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*.012),
              ) ,
              child: AppBarIconWidget(press: (){
                setState(() {
                  CacheHelper.saveData(key: "oldNotificationLength", value: CacheHelper.getData(key: "newNotificationLength"));
                });
                GoRouter.of(context).push("/notificationsViews");
              }, iconPath: AssetData.bell),
            ),
            SizedBox(
              width: AppConstants.width10(context),
            ),
            AppBarIconWidget(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SpeakerChatView(
                    userType: "2",
                  );
                }));
                // GoRouter.of(context).push("/speakerChatView");
              },
              iconPath: AssetData.whiteChat,
            ),
          ],
        ),
      );
    });
  }
}
