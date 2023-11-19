import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import '../../../../../core/shared_widgets/bottom_trailer_component.dart';
import 'onboarding_item.dart';

class OnBoardingViewBody extends StatelessWidget {
  OnBoardingViewBody({super.key});
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              OnBoardingItem(
                image: SvgPicture.asset(AssetData.onboarding1),
                title: "onBoardingTitle0".tr(),
                description:"onBoardingDescription0".tr(),
                noOfScreen: 3,
                onNextPressed: changeScreen,
                currentScreenNo: 0,
              ),
              OnBoardingItem(
                image: SvgPicture.asset(AssetData.onboarding2),
                title: "onBoardingTitle1".tr(),
                description:"onBoardingDescription1".tr(),
                noOfScreen: 3,
                onNextPressed: changeScreen,
                currentScreenNo: 1,
              ),
              OnBoardingItem(
                image: SvgPicture.asset(AssetData.onboarding3),
                title: "onBoardingTitle2".tr(),
                description:"onBoardingDescription2".tr(),
                noOfScreen: 3,
                onNextPressed: changeScreen,
                currentScreenNo: 2,
              ),
            ],
          ),
        ),
        const BottomTrailerComponent(),
      ],
    );
  }
  void changeScreen(int nextScreenNo) {
    controller.jumpToPage(nextScreenNo);
  }
}
