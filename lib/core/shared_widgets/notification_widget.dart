import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets/assets.dart';
import '../utils/colors/colors.dart';
import '../utils/constants.dart';

class AppBarIconWidget extends StatelessWidget {
  AppBarIconWidget({super.key,required this.press,required this.iconPath});
  Function () press;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: press,
      child: Container(
        padding:
        EdgeInsets.all(MediaQuery.of(context).size.height * .005),
        decoration: BoxDecoration(
            color: AppColors.primarySwatchColor,
            borderRadius:
            BorderRadius.circular(AppConstants.sp10(context))),
        child: SvgPicture.asset(iconPath,
            width: MediaQuery.of(context).size.width * .06),
      ),
    );
  }
}
