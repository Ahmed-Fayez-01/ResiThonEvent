import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../features/sessions/presentations/view_models/specific_session_cubit/specific_sessions_cubit.dart';
import '../utils/assets/assets.dart';
import '../utils/constants.dart';

class CustomCountDownWidget extends StatelessWidget {
  const CustomCountDownWidget({super.key, required this.seconds, required this.title, required this.id, this.color});
final int seconds;
final String title;
final Color? color;
final int id;
  @override
  Widget build(BuildContext context) {
    return  Tooltip(
      message: "This Timer For Reservation Not To Start The Session The Session Will Start After The End of this time by 90 Minutes",
      textStyle: TextStyle(
        fontFamily: "Poppins",
        fontSize: MediaQuery.of(context).size.height*.016,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height*.1,
      preferBelow: true,
      verticalOffset: MediaQuery.of(context).size.height*.04,
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width10(context)),
      margin:EdgeInsets.only(left: AppConstants.width30(context),right: AppConstants.width30(context)),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(AppConstants.sp10(context)),
              decoration:  BoxDecoration(
                color: color??Colors.grey.withOpacity(.9),
              ),
              child: Countdown(
                seconds: seconds,
                build: (BuildContext context, double time) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(title,style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * .018,
                        fontFamily: "Poppins"
                    ),),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AssetData.timer,color: Colors.white,width: MediaQuery.of(context).size.width*.05,),
                        SizedBox(width: AppConstants.width5(context),),
                        time.toInt() ~/ (24 * 60 * 60) == 0
                            ? Text(
                          "${time.toInt() ~/ (60 * 60) % 24}:${(time.toInt() ~/ 60) % 60}:${time.toInt() % 60}",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize:
                              MediaQuery.of(context).size.height *
                                  .018),
                        )
                            : Text(
                          "${(time.toInt() ~/ (24 * 60 * 60))} ${'days'.tr()}",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize:
                              MediaQuery.of(context).size.height *
                                  .018),
                        ),
                      ],
                    ),
                  ],
                ),
                onFinished: (){context
                    .read<SpecificSessionsCubit>()
                    .specificSessionsDetails(id: id);},
                interval: const Duration(seconds: 1),
              )),
        ],
      ),
    );
  }
}
