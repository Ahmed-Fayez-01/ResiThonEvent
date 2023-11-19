import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/utils/colors/colors.dart';
import '../../../../../../core/utils/constants.dart';

//ignore: must_be_immutable
class CustomToggleButton extends StatelessWidget {
  CustomToggleButton(
      {Key? key,
        required this.title,
        required this.onTap,
        required this.isActive,
        this.iconPath,
      })
      : super(key: key);
  void Function() onTap;
  final String title;
  final bool isActive;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppConstants.width20(context),
            vertical: AppConstants.height10(context)),
        decoration: BoxDecoration(
            color: isActive? AppColors.secondaryColor:Colors.white,
            borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
            border: Border.all(color:isActive? AppColors.secondaryColor:const Color(0xffDCDCDC))),
        child: Row(
          children: [
            iconPath == null ?const SizedBox(): SvgPicture.asset(iconPath!,color: Color(0xffDCDCDC),),
            iconPath == null ?const SizedBox():SizedBox(
              width: AppConstants.width10(context),
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .016,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  color:isActive?Colors.white:const Color(0xffDCDCDC)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
