import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("contactText".tr() ,style: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
          fontSize: MediaQuery.of(context).size.height * .018,
          color: AppColors.primarySwatchColor,
        ),),
        SizedBox(height: AppConstants.height20(context),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetData.linkedIn),
            SizedBox(width: AppConstants.width10(context),),
            SvgPicture.asset(AssetData.twitter),
            SizedBox(width: AppConstants.width10(context),),
            SvgPicture.asset(AssetData.facebook),
          ],
        )
      ],
    );
  }
}
