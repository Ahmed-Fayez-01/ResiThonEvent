import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/core/shared_widgets/custom_button.dart';
import 'package:resithon_event/core/shared_widgets/custom_toggle_button.dart';
import 'package:resithon_event/core/shared_widgets/error_widget.dart';
import 'package:resithon_event/core/shared_widgets/main_title_component.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/shared_widgets/event_widget.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_helper.dart';
import 'package:resithon_event/features/notifications/presentation/view_models/notifications_cubit.dart';
import 'package:resithon_event/features/user/home/presentation/view_models/event_cubit/event_cubit.dart';
import 'package:resithon_event/features/user/home/presentation/views/widgets/show_my_ticket.dart';
import 'package:resithon_event/features/user/home/presentation/views/widgets/user_home_app_bar.dart';

import '../../../../../../core/shared_widgets/event_time_line.dart';
import '../../../../../sessions/presentations/view_models/all_sessions_cubit/all_sessions_cubit.dart';
import '../../../../../sessions/presentations/view_models/subscribed_sessions_cubit/subscribed_sessions_cubit.dart';
import '../../../../../sessions/presentations/view_models/toggle_cubit/toggle_cubit.dart';
import '../../../../../sessions/presentations/views/widgets/sessions_list_view.dart';
import '../../../../projects/presentation/view_models/projects_cubit/all_projects_cubit.dart';

class UserHomeViewBody extends StatelessWidget {
  const UserHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NotificationsCubit>().getNotificationsData();
    return RefreshIndicator(
      onRefresh: () async{
        context.read<NotificationsCubit>().getNotificationsData();
        context.read<EventCubit>().eventDetails();
        context.read<AllSessionsCubit>().sessionsDetails();
        context.read<SubscribedSessionsCubit>().subscribedSessionsDetails();
        context.read<AllProjectsCubit>().allProjectsDetails();
      },
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: AppConstants.height15(context),
          ),
          const UserHomeAppBar(),
          SizedBox(
            height: AppConstants.height20(context),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child: DefaultButton(
              onPress: () {
                showMyTicket(
                  context: context,
                  code: CacheHelper.getData(key: "code"),
                  button: DefaultButton(
                      onPress: () {
                        Navigator.pop(context);
                      },
                      borderRadius: AppConstants.sp10(context),
                      text: "close".tr()),
                );
              },
              text: "myTicket".tr(),
              icon: SvgPicture.asset(AssetData.ticket),
              borderRadius: AppConstants.sp10(context),
              backgroundColor: const Color(0xCC323232),
            ),
          ),
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
                        fontSize: MediaQuery.of(context).size.height * .014,
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
                          title: "subScribed".tr(),
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
                        return CustomErrorWidget(
                          onTap: () {
                            context.read<AllSessionsCubit>().sessionsDetails();
                          },
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
                  ):BlocBuilder<SubscribedSessionsCubit,
                          SubscribedSessionsState>(
                          builder: (BuildContext context, state) {
                            if (state is UserSubscribedSessionsSuccessState) {
                              return SessionsListView(
                                instance: state.model,
                              );
                            } else if (state
                                is UserSubscribedSessionsErrorState) {
                              return CustomErrorWidget(
                                onTap: () {
                                  context.read<SubscribedSessionsCubit>().subscribedSessionsDetails();
                                },
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
