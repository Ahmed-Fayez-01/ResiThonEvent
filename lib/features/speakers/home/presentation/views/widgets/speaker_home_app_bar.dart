import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/core/shared_widgets/notification_widget.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:badges/badges.dart' as badges;
import 'package:resithon_event/features/notifications/presentation/view_models/notifications_cubit.dart';
import 'package:resithon_event/features/notifications/presentation/view_models/notifications_states.dart';
import '../../../../../../core/utils/services/local_services/cache_helper.dart';
import '../../../../chat/presentation/views/chat_view.dart';

class SpeakerHomeAppBar extends StatelessWidget {
  const SpeakerHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    print(CacheHelper.getData(key: "NotificationsListLengthInCash"));
    print("mostafa in SpeakerHomeAppBar");
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
          BlocProvider(
            create: (context) => NotificationsCubit.get(context)..getNotificationsData(),
            child: BlocBuilder<NotificationsCubit , NotificationsStates>(
              builder: (context , state){
                 int lInCash = CacheHelper.getData(key: "NotificationsListLengthInCash") ?? 0 ;
                 print(lInCash);
                 print("mostafa lInCash");
                 NotificationsCubit.l = ( NotificationsCubit.get(context).notificationsListLength  - lInCash);
                 print(NotificationsCubit.l);
                 print("5"*10);
                 print("5"*10);
                return
                  state is !GetAllNotificationsDataLoadingState ?
                  badges.Badge(
                  badgeContent: Text(
                    '${NotificationsCubit.l}',
                    style: const TextStyle(color: Colors.white),
                  ) ,
                  child: AppBarIconWidget(
                      press: () {
                        GoRouter.of(context).push("/notificationsViews");
                      },
                      iconPath: AssetData.bell),
                ) : const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primarySwatchColor,
                    ),
                  );
              },
            ),
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
  }
}
