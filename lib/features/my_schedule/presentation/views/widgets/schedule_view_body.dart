import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resithon_event/core/shared_widgets/error_widget.dart';
import 'package:resithon_event/features/my_schedule/presentation/view_models/dated_subscribed_sessions.cubit/dated_subscribed_sessions_cubit.dart';

import '../../../../../../core/shared_widgets/custom_back_button.dart';
import '../../../../../../core/shared_widgets/event_time_line.dart';
import '../../../../../../core/shared_widgets/schedule_item.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../core/utils/assets/assets.dart';

class ScheduleViewBody extends StatelessWidget {
  const ScheduleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppConstants.height20(context),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: const CustomBackButton(),
        ),
        SizedBox(
          height: AppConstants.height20(context),
        ),
        EventTimeLine(
          openClick: true,
          all: false,
        ),
        SizedBox(
          height: AppConstants.height10(context),
        ),
        BlocBuilder<DatedSubscribedSessionsCubit, DatedSubscribedSessionsState>(
          builder: (context, state) {
            if (state is UserDatedSubscribedSessionsSuccessState) {
              return state.model.data!.isNotEmpty
                  ? Expanded(
                      child: ListView.separated(
                          itemCount: state.model.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ScheduleItem(
                              instance: state.model.data![index],
                            );
                          }, separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: AppConstants.height10(context),);
                      },))
                  : Expanded(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetData.noSessions,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * .8,
                        ),
                        Text(
                          "No Sessions Yet in Your Schedule",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.height * .016,
                            fontFamily: "Poppins",
                            color: const Color(0xffA5A5A5),
                          ),
                        ),
                      ],
                    ));
            } else if (state is UserDatedSubscribedSessionsLoadingState) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is UserDatedSubscribedSessionsErrorState) {
              return Expanded(
                child: CustomErrorWidget(height: MediaQuery.of(context).size.height*.2, imgWidth: MediaQuery.of(context).size.width*.2,),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
