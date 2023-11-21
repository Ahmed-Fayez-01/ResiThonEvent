import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/core/shared_widgets/custom_button.dart';
import 'package:resithon_event/core/shared_widgets/main_title_component.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/shared_widgets/event_widget.dart';
import 'package:resithon_event/features/orginizer/home/presentation/views/widgets/food_listView.dart';
import 'package:resithon_event/features/orginizer/home/presentation/views/widgets/organizer_sessions_list_view.dart';
import 'package:resithon_event/features/orginizer/scan_qr/presentation/views/scan_qr_view.dart';

import '../../../../../../core/shared_widgets/custom_toggle_button.dart';
import '../../../../../../core/shared_widgets/error_widget.dart';
import '../../../../../../core/shared_widgets/event_time_line.dart';
import '../../../../../../core/shared_widgets/notification_widget.dart';
import '../../../../../../core/utils/services/local_services/cache_helper.dart';
import '../../../../../sessions/presentations/view_models/all_sessions_cubit/all_sessions_cubit.dart';
import '../../../../../sessions/presentations/view_models/subscribed_sessions_cubit/subscribed_sessions_cubit.dart';
import '../../../../../sessions/presentations/view_models/toggle_cubit/toggle_cubit.dart';
import '../../../../../sessions/presentations/views/widgets/sessions_list_view.dart';

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
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.width20(context)),
                child: MainTitleComponent(title: "discoverEvent".tr()),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.width20(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppBarIconWidget(press: () {}, iconPath: AssetData.bell),
                    SizedBox(width: AppConstants.width10(context),),
                    AppBarIconWidget(press: () {
                      CacheHelper.removeData(key: "name",);
                      CacheHelper.removeData(key: "image",);
                      CacheHelper.removeData(key: "role",);
                      CacheHelper.removeData(key: "QR",);
                      CacheHelper.removeData(key: "bio",);
                      CacheHelper.removeData(key: "code",);
                      CacheHelper.removeData(key: "can_rate",);
                      CacheHelper.removeData(key: "event_start_day",);
                      CacheHelper.removeData(key: "event_end_day",);

                      GoRouter.of(context).go("/loginView");
                    }, iconPath: AssetData.signOut),
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
          EventTimeLine(
            openClick: false,
            all: true,
          ),
          SizedBox(
            height: AppConstants.height10(context),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child: MainTitleComponent(title: "sessions".tr()),
          ),
          SizedBox(
            height: AppConstants.height10(context),
          ),
          BlocBuilder<ToggleCubit, ToggleState>(
            builder: (BuildContext context, ToggleState state) {
              ToggleCubit cubit = ToggleCubit.get(context);
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.width20(context)),
                    child: Row(
                      children: [
                        CustomToggleButton(
                          title: "Sessions".tr(),
                          iconPath: AssetData.done,
                          onTap: () {
                            if (AppConstants.currentUserSessionIndex != 0) {
                              cubit.toggleButton();
                            }
                          },
                          isActive: AppConstants.currentUserSessionIndex == 0
                              ? true
                              : false,
                        ),
                        SizedBox(
                          width: AppConstants.width10(context),
                        ),
                        CustomToggleButton(
                          title: "Food".tr(),
                          iconPath: AssetData.all,
                          onTap: () {
                            if (AppConstants.currentUserSessionIndex != 1) {
                              cubit.toggleButton();
                            }
                          },
                          isActive: AppConstants.currentUserSessionIndex == 1
                              ? true
                              : false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppConstants.height10(context),
                  ),
                      BlocBuilder<SubscribedSessionsCubit,
                      SubscribedSessionsState>(
                    builder: (BuildContext context, state) {
                      if (state is UserSubscribedSessionsSuccessState) {
                        return AppConstants.currentUserSessionIndex == 0 ?SessionsListView(
                          instance: state.model,
                        ):FoodListView(instance: state.model,);
                      } else if (state
                      is UserSubscribedSessionsErrorState) {
                        return CustomErrorWidget(height: MediaQuery.of(context).size.height*.24, imgWidth: MediaQuery.of(context).size.width*.2);
                      } else if (state
                      is UserSubscribedSessionsLoadingState) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * .2,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                ],
              );
            },
          ),

        ],
      ),
    );
  }
}
