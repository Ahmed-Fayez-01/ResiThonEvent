import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class AboutInfoPoint extends StatelessWidget {
  const AboutInfoPoint({super.key,required this.title,required this.iconPath,required this.subTitle});
final String iconPath;
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
        border: Border.all(
            color: AppColors.secondaryColor
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.sp20(context)),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,textAlign: TextAlign.center,style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.height*.018,
                  color: AppColors.secondaryColor,
                ),),
                SizedBox(height: AppConstants.height5(context),),
                Text(subTitle,textAlign: TextAlign.center,style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.height*.014,
                  color: const Color(0xffC8C8C8),
                ),),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(iconPath),
          ],
        ),
      ),
    );
  }
}
