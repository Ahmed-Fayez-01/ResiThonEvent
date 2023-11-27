import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/core/shared_widgets/error_widget.dart';
import 'package:resithon_event/features/my_schedule/presentation/view_models/dated_subscribed_sessions.cubit/dated_subscribed_sessions_cubit.dart';

import '../../../../../../core/shared_widgets/custom_back_button.dart';
import '../../../../../../core/shared_widgets/event_time_line.dart';
import '../../../../../../core/shared_widgets/schedule_item.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/services/local_services/cache_helper.dart';

class ScheduleViewBody extends StatefulWidget {
  const ScheduleViewBody({super.key});

  @override
  State<ScheduleViewBody> createState() => _ScheduleViewBodyState();
}

class _ScheduleViewBodyState extends State<ScheduleViewBody> {
  var date;
  @override
  void initState() {

    date= DateTime.now().isBefore(DateTime(
        int.parse(CacheHelper.getData(key:"event_start_day").split(
            "-")[0]),
        int.parse(CacheHelper.getData(key:"event_start_day").split(
            "-")[1]),
        int.parse(CacheHelper.getData(key:"event_start_day").split(
            "-")[2])),) ?date= DateTime(
        int.parse(CacheHelper.getData(key:"event_start_day").split(
            "-")[0]),
        int.parse(CacheHelper.getData(key:"event_start_day").split(
            "-")[1]),
        int.parse(CacheHelper.getData(key:"event_start_day").split(
            "-")[2])):DateTime.now();

    context.read<DatedSubscribedSessionsCubit>().datedSubscribedSessionsDetails(query: {
      "date":DateFormat('yyyy-MM-dd',"en").format(date),
    });

    super.initState();
  }
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
          child: CustomBackButton(onpress: () {
            Navigator.pop(context);
          },),
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
              print("Abo Sayed:${state.model.data!}");
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
                        SvgPicture.asset(
                          AssetData.noSessions,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * .5,
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
                child: CustomErrorWidget(onTap: () {
                  context.read<DatedSubscribedSessionsCubit>().datedSubscribedSessionsDetails(query: {
                    "date":DateFormat('yyyy-MM-dd',"en").format(date),
                  });
                },),
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
