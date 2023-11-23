import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resithon_event/core/shared_widgets/custom_search_bar.dart';
import 'package:resithon_event/core/utils/services/remote_services/service_locator.dart';

import '../../../../../../core/shared_widgets/custom_toggle_button.dart';
import '../../../../../../core/shared_widgets/error_widget.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../sessions/data/repos/sessions_repo/sessions_repo.dart';
import '../../../../../sessions/presentations/view_models/subscribed_sessions_cubit/subscribed_sessions_cubit.dart';
import '../../../data/repo/speaker_chat_repo_impl.dart';
import '../../view_model/speaker_chat_cubit.dart';
import 'chat_name_item.dart';
import 'inactive_sessions_widget.dart';

class SpeakerChatViewBody extends StatelessWidget {
  const SpeakerChatViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<SubscribedSessionsCubit>()
        .subscribedSessionsDetails();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => SpeakerChatCubit(
                  getIt.get<SpeakersChatRepoImpl>(),
                )),
      ],
      child: BlocBuilder<SpeakerChatCubit, SpeakerChatState>(
        builder: (context, state) {
          var speakerChatCubit = SpeakerChatCubit.get(context);
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child: Column(
              children: [
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                // const CustomSearchBar(),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                Row(
                  children: [
                    CustomToggleButton(
                      onTap: () {
                        speakerChatCubit
                            .toggleChats(speakerChatCubit.isActiveValue = true);
                      },
                      title: "activeSessions".tr(),
                      isActive: speakerChatCubit.isActiveValue,
                    ),
                    SizedBox(
                      width: AppConstants.width15(context),
                    ),
                    CustomToggleButton(
                      onTap: () {
                        speakerChatCubit.toggleChats(
                            speakerChatCubit.isActiveValue = false);
                      },
                      title: "inActiveSessions".tr(),
                      isActive: !speakerChatCubit.isActiveValue,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                if (speakerChatCubit.isActiveValue == true)
                  BlocBuilder<SubscribedSessionsCubit, SubscribedSessionsState>(
                    builder: (context, state) {
                      if (state is UserSubscribedSessionsSuccessState) {
                        return ChatNameItem(
                          availble: "avilable",
                          sessionsModel: state.model,
                        );
                      } else if (state is UserSubscribedSessionsErrorState) {
                        return CustomErrorWidget(
                          onTap: () {
                            context.read<SubscribedSessionsCubit>().subscribedSessionsDetails();
                          },
                        );
                      } else if (state is UserSubscribedSessionsLoadingState) {
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                if (speakerChatCubit.isActiveValue == false)
                  BlocBuilder<SubscribedSessionsCubit, SubscribedSessionsState>(
                    builder: (context, state) {
                      if (state is UserSubscribedSessionsSuccessState) {
                        return InactiveSessionsWidget(
                          availble: "not available",
                          sessionsModel: state.model,
                        );
                      } else if (state is UserSubscribedSessionsErrorState) {
                        return CustomErrorWidget(onTap: () {
                          context.read<SubscribedSessionsCubit>().subscribedSessionsDetails();
                        },
                        );
                      } else if (state is UserSubscribedSessionsLoadingState) {
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
