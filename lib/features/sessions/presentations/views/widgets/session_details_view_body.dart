import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resithon_event/core/shared_widgets/custom_dialog.dart';
import 'package:resithon_event/core/shared_widgets/custon_time_count_down_widget.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_helper.dart';
import 'package:resithon_event/features/sessions/presentations/view_models/all_sessions_cubit/all_sessions_cubit.dart';
import 'package:resithon_event/features/sessions/presentations/view_models/book_session_cubit/book_sessions_cubit.dart';
import 'package:resithon_event/features/sessions/presentations/view_models/cancel_session_cubit/cancel_sessions_cubit.dart';
import 'package:resithon_event/features/sessions/presentations/view_models/specific_session_cubit/specific_sessions_cubit.dart';
import 'package:resithon_event/features/sessions/presentations/view_models/subscribed_sessions_cubit/subscribed_sessions_cubit.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/description_point.dart';
import '../../../../../core/shared_widgets/more_details_widget.dart';
import '../../../../../core/shared_widgets/participant_list.dart';
import '../../../../../core/shared_widgets/participant_title.dart';
import '../../../../../core/shared_widgets/session_header.dart';
import '../../../../../core/shared_widgets/user_image_and_name.dart';
import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/text_styles/styles.dart';
import '../../../../user/home/presentation/views/widgets/show_my_ticket.dart';
import '../session_evaluation_view.dart';

class UserSessionDetailsViewBody extends StatefulWidget {
  const UserSessionDetailsViewBody({super.key, required this.id});

  final int id;

  @override
  State<UserSessionDetailsViewBody> createState() =>
      _UserSessionDetailsViewBodyState();
}

class _UserSessionDetailsViewBodyState
    extends State<UserSessionDetailsViewBody> {
  @override
  void initState() {
    context
        .read<SpecificSessionsCubit>()
        .specificSessionsDetails(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Expired : ${CacheHelper.getData(key: "session_expired")}");
    return BlocBuilder<SpecificSessionsCubit, SpecificSessionsState>(
      builder: (BuildContext context, state) {
        if (state is UserSpecificSessionsSuccessState) {
          print(
              "${DateTime.parse("${state.model.data!.date} ${state.model.data!.endTime}").difference(DateTime.parse("${state.model.data!.date} ${state.model.data!.startTime}")).inSeconds}");
          return RefreshIndicator(
            onRefresh: () async {
              context
                  .read<SpecificSessionsCubit>()
                  .specificSessionsDetails(id: widget.id);
            },
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SessionHeader(
                          count: state.model.data!.count!,
                          totalCount: state.model.data!.totalCount!,
                          imagPath: state.model.data!.image!,
                          totalParticipant:
                              state.model.data!.participants!.length,
                          reservation_expire:
                              state.model.data!.reservation_expire!,
                          expired: state.model.data!.session_expire!,
                        ),
                        state.model.data!.session_expire!
                            ? const SizedBox()
                            : !state.model.data!.reservation_expire!
                                ? CustomCountDownWidget(
                                    seconds: (DateTime.parse(
                                                "${state.model.data!.date} ${state.model.data!.startTime}")
                                            .difference(DateTime.now())
                                            .inSeconds) -
                                        int.parse(CacheHelper.getData(
                                                    key: "session_expired")
                                                .toString()) *
                                            60,
                                    title: 'Reservation End After',
                                    id: widget.id,
                                  )
                                : state.model.data!.session_started!
                                    ? CustomCountDownWidget(
                                        seconds: (DateTime.parse(
                                                "${state.model.data!.date} ${state.model.data!.endTime}")
                                            .difference(DateTime.parse(
                                                "${state.model.data!.date} ${state.model.data!.startTime}"))
                                            .inSeconds),
                                        title: 'Session in Progress',
                                        color: AppColors.greenColor,
                                        id: widget.id,
                                      )
                                    : CustomCountDownWidget(
                                        seconds: (DateTime.parse(
                                                "${state.model.data!.date} ${state.model.data!.startTime}")
                                            .difference(DateTime.now())
                                            .inSeconds),
                                        title: 'Session Start After',
                                        id: widget.id,
                                      ),
                        SizedBox(
                          height: AppConstants.height20(context),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.width20(context)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.model.data!.name!,
                                style: Styles.eventSessionTitle(context)
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .022),
                              ),
                              SizedBox(
                                height: AppConstants.height20(context),
                              ),
                              UserImageAndName(
                                  image: state.model.data!.speaker_image!,
                                  name: state.model.data!.speaker!),
                              SizedBox(
                                height: AppConstants.height20(context),
                              ),
                              DescriptionPoint(
                                  iconPath: AssetData.location,
                                  description: state.model.data!.venue!),
                              SizedBox(
                                height: AppConstants.height10(context),
                              ),
                              DescriptionPoint(
                                  iconPath: AssetData.calender,
                                  description: state.model.data!.date!),
                              SizedBox(
                                height: AppConstants.height10(context),
                              ),
                              DescriptionPoint(
                                  iconPath: AssetData.timer,
                                  description:
                                      "${state.model.data!.startTime} - ${state.model.data!.endTime}"),
                              SizedBox(
                                height: AppConstants.height20(context),
                              ),
                              MoreDetailsWidget(
                                title: 'moreDetails'.tr(),
                                description: state.model.data!.description!,
                              ),
                              SizedBox(
                                height: AppConstants.height20(context),
                              ),
                              const ParticipantTitle(),
                              SizedBox(
                                height: AppConstants.height20(context),
                              ),
                            ],
                          ),
                        ),
                        state.model.data!.participants!.isNotEmpty
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .15,
                                child: ParticipantList(
                                  participants: state.model.data!.participants,
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AssetData.noParticipant,
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                  ),
                                  Text(
                                    "No Participants have Joined Yet be the First One.",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .016,
                                      fontFamily: "Poppins",
                                      color: const Color(0xffA5A5A5),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppConstants.height20(context),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
                if (CacheHelper.getData(key: "role") != "1" &&
                    CacheHelper.getData(key: "role") != "2")
                  state.model.data!.session_expire!
                      ? DefaultButton(
                          backgroundColor: AppColors.secondaryColor,
                          onPress: () {
                            if (state.model.data!.has_rate!) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("This Session Already Rated"),
                                backgroundColor: Colors.red,
                              ));
                            } else {
                              if (state.model.data!.is_arrived!) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SessionEvaluationView(
                                              sessionId: widget.id,
                                            )));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Rating Not Available For You"),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            }
                          },
                          text: "Rate The Session")
                      : !state.model.data!.reservation_expire!
                          ? state.model.data!.count! <
                                  int.parse(state.model.data!.totalCount!)
                              ? Column(
                                  children: [
                                    state.model.data!.attend!
                                        ? BlocConsumer<CancelSessionsCubit,
                                            CancelSessionsState>(
                                            builder:
                                                (BuildContext context, state) {
                                              return DefaultButton(
                                                onPress: () {
                                                  context
                                                      .read<
                                                          CancelSessionsCubit>()
                                                      .cancelBookSession(
                                                          id: widget.id);
                                                },
                                                text:
                                                    "cancelSessionButton".tr(),
                                                backgroundColor:
                                                    const Color(0xff323232),
                                              );
                                            },
                                            listener: (BuildContext context,
                                                CancelSessionsState state) {
                                              if (state
                                                  is UserCancelSessionsSuccessState) {
                                                context
                                                    .read<
                                                        SubscribedSessionsCubit>()
                                                    .subscribedSessionsDetails();
                                                context
                                                    .read<AllSessionsCubit>()
                                                    .sessionsDetails();
                                                Navigator.pop(context);
                                                customPopUpDialog(
                                                  context: context,
                                                  button: DefaultButton(
                                                    onPress: () {
                                                      Navigator.pop(context);
                                                      context
                                                          .read<
                                                              SpecificSessionsCubit>()
                                                          .specificSessionsDetails(
                                                              id: widget.id);
                                                    },
                                                    text: "okay".tr(),
                                                    borderRadius:
                                                        AppConstants.sp10(
                                                            context),
                                                    backgroundColor:
                                                        const Color(0xff323232),
                                                  ),
                                                  icon: AssetData.cancel,
                                                  mainTitle:
                                                      "cancelMessage".tr(),
                                                );
                                              } else if (state
                                                  is UserCancelSessionsErrorState) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content:
                                                      Text(state.errMessage),
                                                  backgroundColor: Colors.red,
                                                ));
                                              } else if (state
                                                  is UserCancelSessionsLoadingState) {
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) =>
                                                      WillPopScope(
                                                    onWillPop: () {
                                                      return Future.value(
                                                          false);
                                                    },
                                                    child: AlertDialog(
                                                      insetPadding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      content: SizedBox(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 20),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              SpinKitCubeGrid(
                                                                color: AppColors
                                                                    .primaryColor,
                                                                size: 40.0,
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                "loadingLogin"
                                                                    .tr(),
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          )
                                        : BlocConsumer<BookSessionsCubit,
                                            BookSessionsState>(
                                            builder: (BuildContext context,
                                                BookSessionsState state) {
                                              return DefaultButton(
                                                onPress: () {
                                                  context
                                                      .read<BookSessionsCubit>()
                                                      .bookSession(
                                                          id: widget.id);
                                                },
                                                text: "bookNow".tr(),
                                              );
                                            },
                                            listener: (BuildContext context,
                                                BookSessionsState state) {
                                              if (state
                                                  is UserBookSessionsSuccessState) {
                                                context
                                                    .read<
                                                        SubscribedSessionsCubit>()
                                                    .subscribedSessionsDetails();
                                                context
                                                    .read<AllSessionsCubit>()
                                                    .sessionsDetails();
                                                Navigator.pop(context);
                                                customPopUpDialog(
                                                  context: context,
                                                  button: DefaultButton(
                                                    onPress: () {
                                                      Navigator.pop(context);
                                                      context
                                                          .read<
                                                              SpecificSessionsCubit>()
                                                          .specificSessionsDetails(
                                                              id: widget.id);
                                                    },
                                                    text: "okay".tr(),
                                                    borderRadius:
                                                        AppConstants.sp10(
                                                            context),
                                                  ),
                                                  icon: AssetData.book,
                                                  mainTitle: "bookMessage".tr(),
                                                );
                                              } else if (state
                                                  is UserBookSessionsErrorState) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content:
                                                      Text(state.errMessage),
                                                  backgroundColor: Colors.red,
                                                ));
                                              } else if (state
                                                  is UserBookSessionsLoadingState) {
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) =>
                                                      WillPopScope(
                                                    onWillPop: () {
                                                      return Future.value(
                                                          false);
                                                    },
                                                    child: AlertDialog(
                                                      insetPadding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      content: SizedBox(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 20),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              SpinKitCubeGrid(
                                                                color: AppColors
                                                                    .primaryColor,
                                                                size: 40.0,
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                "loadingLogin"
                                                                    .tr(),
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          )
                                  ],
                                )
                              : const SizedBox()
                          : state.model.data!.session_started!
                              ? DefaultButton(
                                  onPress: () {
                                    showMyTicket(
                                      context: context,
                                      code: CacheHelper.getData(key: "code"),
                                      button: DefaultButton(
                                          onPress: () {
                                            Navigator.pop(context);
                                          },
                                          borderRadius:
                                              AppConstants.sp10(context),
                                          text: "close".tr()),
                                    );
                                  },
                                  text: "myTicket".tr(),
                                  icon: SvgPicture.asset(AssetData.ticket),
                                  backgroundColor: const Color(0xCC323232),
                                )
                              : const SizedBox(),
              ],
            ),
          );
        } else if (state is UserSpecificSessionsErrorState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Text(state.errMessage),
            ),
          );
        } else if (state is UserSpecificSessionsLoadingState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
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
