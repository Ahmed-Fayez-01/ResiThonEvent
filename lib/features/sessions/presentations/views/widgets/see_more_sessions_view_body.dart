import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resithon_event/features/sessions/presentations/views/widgets/session_b_list_view.dart';

import '../../../../../core/shared_widgets/custom_toggle_button.dart';
import '../../../../../core/shared_widgets/error_widget.dart';
import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../view_models/all_sessions_cubit/all_sessions_cubit.dart';
import '../../view_models/subscribed_sessions_cubit/subscribed_sessions_cubit.dart';
import '../../view_models/toggle_cubit/toggle_cubit.dart';

class SeeMoreSessionsViewBody extends StatelessWidget {
  const SeeMoreSessionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: AppConstants.height20(context),),
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
                          title: "subScribed".tr(),
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
                          title: "all".tr(),
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
                    height: AppConstants.height20(context),
                  ),
                  AppConstants.currentUserSessionIndex == 0
                      ? BlocBuilder<SubscribedSessionsCubit,
                      SubscribedSessionsState>(
                    builder: (BuildContext context, state) {
                      if (state is UserSubscribedSessionsSuccessState) {
                        return SessionsBListView(
                          instance: state.model,
                        );
                      } else if (state
                      is UserSubscribedSessionsErrorState) {
                        return CustomErrorWidget(height: MediaQuery
                            .of(context)
                            .size
                            .height * .2, imgWidth: MediaQuery
                            .of(context)
                            .size
                            .width * .2,);
                      } else if (state
                      is UserSubscribedSessionsLoadingState) {
                        return SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .2,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                      : BlocBuilder<AllSessionsCubit, AllSessionsState>(
                    builder: (BuildContext context, state) {
                      if (state is UserAllSessionsSuccessState) {
                        return SessionsBListView(
                          instance: state.model,
                        );
                      } else if (state is UserAllSessionsErrorState) {
                        return SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .2,
                          child: Center(
                            child: Text(state.errMessage),
                          ),
                        );
                      } else if (state is UserAllSessionsLoadingState) {
                        return SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .2,
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
