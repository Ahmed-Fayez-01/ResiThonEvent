import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resithon_event/core/shared_widgets/main_title_component.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/shared_widgets/event_widget.dart';
import 'package:resithon_event/features/orginizer/home/presentation/views/widgets/organizer_sessions_list_view.dart';

import '../../../../../../core/shared_widgets/event_time_line.dart';
import '../../../../../../core/shared_widgets/notification_widget.dart';

class OrganizerHomeViewBody extends StatelessWidget {
  const OrganizerHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: AppConstants.height10(context),
          ),
          Row(
            children: [
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                child: MainTitleComponent(title: "discoverEvent".tr()),
              ),
              const Spacer(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppBarIconWidget(press: (){}, iconPath: AssetData.bell),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppConstants.height20(context),
          ),
          const EventWidget(),
          SizedBox(
            height: AppConstants.height20(context),
          ),
          EventTimeLine(openClick: false,all: true,),
          SizedBox(
            height: AppConstants.height10(context),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child:  MainTitleComponent(title: "sessions".tr()),
          ),
          SizedBox(
            height: AppConstants.height10(context),
          ),
          // const OrganizerSessionsListView(),
        ],
      ),
    );
  }
}
