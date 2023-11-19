import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_helper.dart';
import 'package:resithon_event/features/sessions/presentations/view_models/specific_session_cubit/specific_sessions_cubit.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../features/sessions/data/models/sessions_model.dart';
import '../utils/services/local_services/cache_keys.dart';
import 'custom_back_button.dart';
import '../utils/assets/assets.dart';
import '../utils/colors/colors.dart';
import '../utils/constants.dart';

class SessionHeader extends StatelessWidget {
  const SessionHeader(
      {super.key,
      required this.avalability,
      required this.totalCount,
      required this.totalParticipant,
      required this.imagPath,});

  final String avalability;
  final String imagPath;
  final String totalCount;
  final int totalParticipant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: imagPath,
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: AppColors.greyColor,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.all(AppConstants.sp20(context)),
              child: const CustomBackButton(),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .04,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.width20(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(AppConstants.sp10(context)),
                    decoration: BoxDecoration(
                      color: avalability == "available"
                          ? const Color(0xff27AE60)
                          : AppColors.greyColor,
                      borderRadius:
                      BorderRadius.circular(AppConstants.sp10(context)),
                    ),
                    child: Text(
                      avalability == "available" ? "Available" : "Completed",
                      style:  TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: MediaQuery.of(context).size.height*.016,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: LinearPercentIndicator(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: MediaQuery.of(context).size.height * .03,
                  percent: totalParticipant / int.parse(totalCount),
                  center: Text(
                    "$totalParticipant/$totalCount",
                    style: const TextStyle(color: Colors.white),
                  ),
                  linearStrokeCap: LinearStrokeCap.butt,
                  backgroundColor: const Color(0x22000000),
                  progressColor: AppColors.primarySwatchColor),
            ),
          ),
        ],
      ),
    );
  }
}
