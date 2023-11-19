import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/core/shared_widgets/capitalize_extention.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/core/utils/constants.dart';

import '../../features/agenda/presentation/view_models/dated_all_sessions_cubit/dated_all_sessions_cubit.dart';
import '../../features/my_schedule/presentation/view_models/dated_subscribed_sessions.cubit/dated_subscribed_sessions_cubit.dart';
import '../../features/user/home/presentation/view_models/event_cubit/event_cubit.dart';
import '../utils/assets/assets.dart';
import '../utils/services/local_services/cache_helper.dart';
import 'error_widget.dart';
import 'main_title_component.dart';

class EventTimeLine extends StatefulWidget {
  EventTimeLine({super.key, required this.openClick, required this.all});

  bool openClick = false;
  bool all = false;

  @override
  State<EventTimeLine> createState() => _EventTimeLineState();
}

class _EventTimeLineState extends State<EventTimeLine> {
  DateTime _focusDate = DateTime.now().isBefore(DateTime(
      int.parse(CacheHelper.getData(key:"event_start_day").split(
          "-")[0]),
      int.parse(CacheHelper.getData(key:"event_start_day").split(
          "-")[1]),
      int.parse(CacheHelper.getData(key:"event_start_day").split(
          "-")[2])),) ?DateTime(
      int.parse(CacheHelper.getData(key:"event_start_day").split(
          "-")[0]),
      int.parse(CacheHelper.getData(key:"event_start_day").split(
          "-")[1]),
      int.parse(CacheHelper.getData(key:"event_start_day").split(
          "-")[2])):DateTime.now();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (BuildContext context, EventState state) {
        if (state is UserEventSuccessState) {
          return Column(
            children: [
              widget.openClick ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.width20(context)),
                child: Row(
                  children: [
                    MainTitleComponent(
                        title: DateFormat("MMMM").format(DateTime(
                            int.parse(state.model.data!.startDate!.split(
                                "-")[0]),
                            int.parse(state.model.data!.startDate!.split(
                                "-")[1]),
                            int.parse(state.model.data!.startDate!.split(
                                "-")[2])))),
                    const Spacer(),
                    SvgPicture.asset(
                      AssetData.calender,
                      color: const Color(0xCC323232),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .05,
                    ),
                  ],
                ),
              ) : const SizedBox(),
              widget.openClick ? SizedBox(
                height: AppConstants.height20(context),
              ) : const SizedBox(),
              EasyInfiniteDateTimeLine(
                // controller: _controller,
                showTimelineHeader: false,
                firstDate: DateTime(
                    int.parse(state.model.data!.startDate!.split("-")[0]),
                    int.parse(state.model.data!.startDate!.split("-")[1]),
                    int.parse(state.model.data!.startDate!.split("-")[2])),
                focusDate: _focusDate,
                lastDate: DateTime(
                    int.parse(state.model.data!.endDate!.split("-")[0]),
                    int.parse(state.model.data!.endDate!.split("-")[1]),
                    int.parse(state.model.data!.endDate!.split("-")[2])),
                onDateChange: (selectedDate) {
                  if (widget.openClick == true) {
                    setState(() {
                      _focusDate = selectedDate;
                      widget.all && widget.openClick ? context.read<
                          DatedAllSessionsCubit>().datedAllSessionsDetails(
                          query: {
                            "date": DateFormat('yyyy-MM-dd').format(
                                selectedDate)
                          }) : context.read<DatedSubscribedSessionsCubit>()
                          .datedSubscribedSessionsDetails(query: {
                        "date": DateFormat('yyyy-MM-dd').format(selectedDate)
                      });
                    });
                  }
                },
                dayProps: EasyDayProps(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .1,
                  // You must specify the width in this case.
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .16,
                ),
                itemBuilder: (BuildContext context, String dayNumber, dayName,
                    monthName, fullDate, isSelected) {
                  return Column(
                    children: [
                      Container(
                        //the same width that provided previously.
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .15,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * .075,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.width10(context)),
                        decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primarySwatchColor
                                : null,
                            borderRadius:
                            BorderRadius.circular(AppConstants.sp10(context)),
                            border: Border.all(
                                color: isSelected
                                    ? AppColors.primarySwatchColor
                                    : fullDate.isBefore(DateTime(
                                    int.parse(state.model.data!.endDate!.split(
                                        "-")[0]),
                                    int.parse(state.model.data!.endDate!.split(
                                        "-")[1]),
                                    int.parse(state.model.data!.endDate!.split(
                                        "-")[2]) + 1),) &&
                                    fullDate.isAfter(DateTime(
                                        int.parse(
                                            state.model.data!.startDate!.split(
                                                "-")[0]),
                                        int.parse(
                                            state.model.data!.startDate!.split(
                                                "-")[1]),
                                        int.parse(
                                            state.model.data!.startDate!.split(
                                                "-")[2]) - 1),) &&
                                    fullDate.isAfter(DateTime(
                                        DateTime
                                            .now()
                                            .year,
                                        DateTime
                                            .now()
                                            .month,
                                        DateTime
                                            .now()
                                            .day))
                                    ? AppColors.secondaryColor
                                    : const Color(0xffDCDCDC)

                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dayName.capitalize(),
                              style: TextStyle(
                                  fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height * .014,
                                  fontFamily: "Poppins",
                                  color: isSelected
                                      ? Colors.white
                                      : fullDate.isBefore(DateTime(
                                      int.parse(
                                          state.model.data!.endDate!.split(
                                              "-")[0]),
                                      int.parse(
                                          state.model.data!.endDate!.split(
                                              "-")[1]),
                                      int.parse(
                                          state.model.data!.endDate!.split(
                                              "-")[2]) + 1)) &&
                                      fullDate
                                          .isAfter(DateTime(
                                          int.parse(state.model.data!.startDate!
                                              .split("-")[0]),
                                          int.parse(state.model.data!.startDate!
                                              .split("-")[1]),
                                          int.parse(state.model.data!.startDate!
                                              .split("-")[2]) - 1)) &&
                                      fullDate.isAfter(DateTime(
                                          DateTime
                                              .now()
                                              .year,
                                          DateTime
                                              .now()
                                              .month,
                                          DateTime
                                              .now()
                                              .day))
                                      ? AppColors.secondaryColor
                                      : const Color(0xffDCDCDC)
                              ),
                            ),
                            Text(
                              dayNumber,
                              style: TextStyle(
                                  fontSize: MediaQuery
                                      .of(context)
                                      .size
                                      .height * .016,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                      ? Colors.white
                                      : fullDate.isBefore(DateTime(
                                      int.parse(
                                          state.model.data!.endDate!.split(
                                              "-")[0]),
                                      int.parse(
                                          state.model.data!.endDate!.split(
                                              "-")[1]),
                                      int.parse(
                                          state.model.data!.endDate!.split(
                                              "-")[2]) + 1)) &&
                                      fullDate
                                          .isAfter(DateTime(
                                          int.parse(state.model.data!.startDate!
                                              .split("-")[0]),
                                          int.parse(state.model.data!.startDate!
                                              .split("-")[1]),
                                          int.parse(state.model.data!.startDate!
                                              .split("-")[2]) - 1)) &&
                                      fullDate.isAfter(DateTime(
                                          DateTime
                                              .now()
                                              .year,
                                          DateTime
                                              .now()
                                              .month,
                                          DateTime
                                              .now()
                                              .day))
                                      ? AppColors.secondaryColor
                                      : const Color(0xffDCDCDC)

                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppConstants.height5(context),
                      ),
                      isSelected
                          ? CircleAvatar(
                        radius: MediaQuery
                            .of(context)
                            .size
                            .height * .007,
                        backgroundColor: AppColors.primarySwatchColor,
                      )
                          : fullDate.isBefore(DateTime(
                          int.parse(state.model.data!.endDate!.split("-")[0]),
                          int.parse(state.model.data!.endDate!.split("-")[1]),
                          int.parse(state.model.data!.endDate!.split("-")[2]) +
                              1)) &&
                          fullDate.isAfter(DateTime(
                              int.parse(
                                  state.model.data!.startDate!.split("-")[0]),
                              int.parse(
                                  state.model.data!.startDate!.split("-")[1]),
                              int.parse(state.model.data!.startDate!.split(
                                  "-")[2]) - 1)) &&
                          fullDate.isAfter(DateTime(DateTime
                              .now()
                              .year,
                              DateTime
                                  .now()
                                  .month, DateTime
                                  .now()
                                  .day))
                          ? const SizedBox()
                          : CircleAvatar(
                        radius:
                        MediaQuery
                            .of(context)
                            .size
                            .height * .007,
                        backgroundColor: const Color(0xffDCDCDC),
                      )

                    ],
                  );
                },
              ),
            ],
          );
        } else if (state is UserEventErrorState) {
          return CustomErrorWidget(
            height: MediaQuery
                .of(context)
                .size
                .height * .1, imgWidth: MediaQuery
              .of(context)
              .size
              .width * .1,);
        } else if (state is UserEventLoadingState) {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .1,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
