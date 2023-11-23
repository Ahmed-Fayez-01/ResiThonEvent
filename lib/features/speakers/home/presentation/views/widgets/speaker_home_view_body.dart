import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/core/shared_widgets/custom_toggle_button.dart';
import 'package:resithon_event/core/shared_widgets/main_title_component.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/shared_widgets/event_widget.dart';
import 'package:resithon_event/features/notifications/presentation/view_models/notifications_cubit.dart';
import 'package:resithon_event/features/speakers/home/presentation/views/widgets/speaker_home_app_bar.dart';

import '../../../../../../core/shared_widgets/event_time_line.dart';
import '../../../../../../core/utils/services/local_services/cache_helper.dart';
import '../../../../../agenda/presentation/view_models/dated_all_sessions_cubit/dated_all_sessions_cubit.dart';
import '../../../../../my_schedule/presentation/view_models/dated_subscribed_sessions.cubit/dated_subscribed_sessions_cubit.dart';
import '../../../../../sessions/presentations/view_models/all_sessions_cubit/all_sessions_cubit.dart';
import '../../../../../sessions/presentations/view_models/subscribed_sessions_cubit/subscribed_sessions_cubit.dart';
import '../../../../../sessions/presentations/view_models/toggle_cubit/toggle_cubit.dart';
import '../../../../../sessions/presentations/views/widgets/sessions_list_view.dart';
import '../../../../../user/home/presentation/view_models/event_cubit/event_cubit.dart';
import '../../../../../user/projects/presentation/view_models/projects_cubit/all_projects_cubit.dart';

class SpeakerHomeViewBody extends StatefulWidget {
  const SpeakerHomeViewBody({super.key});

  @override
  State<SpeakerHomeViewBody> createState() => _SpeakerHomeViewBodyState();
}

class _SpeakerHomeViewBodyState extends State<SpeakerHomeViewBody> {


  @override
  Widget build(BuildContext context) {
    print(CacheHelper.getData(key: "NotificationsListLengthInCash"));
    print("mostafa in SpeakerHomeViewBody");
    print(NotificationsCubit.l);
    return RefreshIndicator(
      onRefresh: () async{
        context.read<EventCubit>().eventDetails();
        context.read<AllSessionsCubit>().sessionsDetails();
        context.read<SubscribedSessionsCubit>().subscribedSessionsDetails();
        context.read<AllProjectsCubit>().allProjectsDetails();
        context.read<NotificationsCubit>().getNotificationsData();
      },
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: AppConstants.height15(context),
          ),
          const SpeakerHomeAppBar(),
          SizedBox(
            height: AppConstants.height20(context),
          ),
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child: MainTitleComponent(title: "discoverEvent".tr()),
          ),
          SizedBox(
            height: AppConstants.height20(context),
          ),
          const EventWidget(),
          SizedBox(
            height: AppConstants.height20(context),
          ),
          EventTimeLine(openClick: false,all: false,),
          SizedBox(
            height: AppConstants.height10(context),
          ),
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child: Row(
              children: [
                MainTitleComponent(title: "sessions".tr()),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push("/seeMoreSessionsView");
                  },
                  child: Text(
                    "more".tr(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .012,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: const Color(0xFF323232)),
                  ),
                ),
              ],
            ),
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
                          title: "all".tr(),
                          iconPath: AssetData.all,
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
                          title: "mySessions".tr(),
                          iconPath: AssetData.done,
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

                  AppConstants.currentUserSessionIndex == 0
                      ? BlocBuilder<AllSessionsCubit, AllSessionsState>(
                    builder: (BuildContext context, state) {
                      if (state is UserAllSessionsSuccessState) {
                        return SessionsListView(
                          instance: state.model,
                        );
                      } else if (state is UserAllSessionsErrorState) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * .2,
                          child: Center(
                            child: Text(state.errMessage),
                          ),
                        );
                      } else if (state is UserAllSessionsLoadingState) {
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
                  ): BlocBuilder<SubscribedSessionsCubit,
                      SubscribedSessionsState>(
                    builder: (BuildContext context, state) {
                      if (state is UserSubscribedSessionsSuccessState) {
                        return SessionsListView(
                          instance: state.model,
                        );
                      } else if (state
                      is UserSubscribedSessionsErrorState) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * .2,
                          child: Center(
                            child: Text(state.errMessage),
                          ),
                        );
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
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
