import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/services/local_services/cache_keys.dart';
import '../../../../../core/utils/text_styles/styles.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacement("/splashSecondary");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Expanded(
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       RichText(
        //         text: TextSpan(
        //           text: 'YA ',
        //           style: Styles.splashTitle(context).copyWith(
        //               color: AppColors.secondaryColor
        //           ),
        //           children: <TextSpan>[
        //             TextSpan(
        //                 text: 'HALAA',
        //                 style: Styles.splashTitle(context).copyWith(
        //                     color: Colors.white
        //                 ),),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetData.logo,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * .6,
            ),
          ],
        )
      ],
    );
  }
}
