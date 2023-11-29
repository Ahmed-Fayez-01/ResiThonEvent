import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_helper.dart';
import 'package:resithon_event/features/onboarding/presentaion/views/widgets/progress_dots.dart';
import '../../../../../core/utils/text_styles/styles.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.noOfScreen,
      required this.onNextPressed,
      required this.currentScreenNo})
      : super(key: key);

  final SvgPicture image;

  final String title;

  final String description;

  final int noOfScreen;

  final Function(int) onNextPressed;

  final int currentScreenNo;

  @override
  Widget build(BuildContext context) {
    bool isLastScreen = currentScreenNo >= noOfScreen - 1;
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Styles.onboardingBigTitleText(context),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Text(
                title,
                style: Styles.onboardingTitleText(context),
              ),
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .33,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      image,
                    ],
                  )),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * .05),
                child: Text(
                  description,
                  style: Styles.onBoardingDescriptionText(context),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int index = 0; index < noOfScreen; index++)
                    ProgressDots(
                      isActiveScreen: (index == currentScreenNo) ? true : false,
                    )
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
              child: Visibility(
                  visible: currentScreenNo != 0,
                  replacement: const SizedBox(),
                  child: GestureDetector(
                    onTap: () {
                      onNextPressed(currentScreenNo - 1);
                    },
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * .07,
                      backgroundColor: const Color(0xffDCDCDC),
                      child: SvgPicture.asset(AssetData.arrowLeft,width: MediaQuery.of(context).size.width * .06,),
                    ),
                  )),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
              child: GestureDetector(
                onTap: () {
                  if(isLastScreen)
                    {
                      CacheHelper.saveData(key: "oldNotificationLength", value: "0");
                      CacheHelper.saveData(key: "onBoarding", value: true);
                      GoRouter.of(context).go("/loginView");
                    }else{
                    onNextPressed(currentScreenNo + 1);
                  }

                },
                child: CircularPercentIndicator(
                  radius: MediaQuery.of(context).size.width * .08,
                  lineWidth: 2.0,
                  percent: (currentScreenNo + 1) * .33,
                  center: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * .065,
                    backgroundColor: AppColors.primarySwatchColor,
                    child: SvgPicture.asset(AssetData.arrowRight,width: MediaQuery.of(context).size.width * .06,),
                  ),
                  progressColor: AppColors.primarySwatchColor,
                  backgroundColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
