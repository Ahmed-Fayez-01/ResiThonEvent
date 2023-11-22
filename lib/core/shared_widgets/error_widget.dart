import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';

import '../utils/assets/assets.dart';
import '../utils/constants.dart';

class CustomErrorWidget extends StatelessWidget {
  CustomErrorWidget({
    super.key,
    required this.onTap
  });
Function ()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetData.serverError,
              width: MediaQuery.of(context).size.width * .25,
            ),
            SizedBox(
              height: AppConstants.height10(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Internal Server Error Try Again Later",
                  style: TextStyle(
                      color: const Color(0xffA5A5A5),
                      fontFamily: "Poppins",
                      fontSize: MediaQuery.of(context).size.height * .014),
                ),
                SizedBox(width: AppConstants.width10(context),),
                GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    "assets/images/reload.svg",
                    width: MediaQuery.of(context).size.width * .07,
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
