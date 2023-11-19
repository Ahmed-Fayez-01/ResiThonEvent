import 'package:flutter/material.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_keys.dart';

import '../utils/colors/colors.dart';
import '../utils/text_styles/styles.dart';

class LogoText extends StatelessWidget {
  LogoText({super.key, this.arabic});

  bool? arabic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                text: 'Resi ',
                style: Styles.splashTitle(context)
                    .copyWith(color: AppColors.secondaryColor),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Thon',
                      style: TextStyle(color: AppColors.primarySwatchColor)),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Resilience Hackathon 2023",
              style: Styles.splashTitle(context).copyWith(
                  color: AppColors.secondaryColor,
                  fontSize: MediaQuery.of(context).size.height * .018),
            ),
          ],
        ),
      ],
    );
  }
}
