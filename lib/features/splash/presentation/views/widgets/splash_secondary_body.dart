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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetData.logo,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * .5,
            ),
          ],
        )
      ],
    );
  }
}
