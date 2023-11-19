import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/services/local_services/cache_helper.dart';
import '../../../../../core/utils/services/local_services/cache_keys.dart';
import '../../../../../core/utils/text_styles/styles.dart';

class SplashSecondaryBody extends StatefulWidget {
  const SplashSecondaryBody({super.key});

  @override
  State<SplashSecondaryBody> createState() => _SplashSecondaryBodyState();
}

class _SplashSecondaryBodyState extends State<SplashSecondaryBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (CacheKeysManger.onBoardingStatus()) {
        if (CacheKeysManger.getUserCodeFromCache() != "") {
          if (CacheHelper.getData(key: "role") == "1") {
            GoRouter.of(context).go("/organizerHomeView");
          } else if (CacheHelper.getData(key: "role") == "2") {
            GoRouter.of(context).go("/speakerHomeView");
          } else {
            GoRouter.of(context).go("/userHomeView");
          }
        } else {
          GoRouter.of(context).pushReplacement("/loginView");
        }
      } else {
        GoRouter.of(context).pushReplacement("/onBoardingView");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Resi ',
                  style: Styles.splashTitle(context).copyWith(
                    color: AppColors.secondaryColor,
                    fontSize: MediaQuery.of(context).size.height * .035,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Thon',
                      style: Styles.splashTitle(context).copyWith(
                        color: AppColors.primarySwatchColor,
                        fontSize: MediaQuery.of(context).size.height * .035,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
