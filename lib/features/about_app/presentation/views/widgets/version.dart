import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class Version extends StatelessWidget {
  const Version({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width30(context)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
          border: Border.all(
              color: const Color(0xffDCDCDC)
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppConstants.sp20(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("version".tr(),textAlign: TextAlign.center,style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.height*.018,
                color: AppColors.secondaryColor,
              ),),
              SizedBox(width: AppConstants.width5(context),),
              Text("1.0.1",textAlign: TextAlign.center,style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.of(context).size.height*.018,
                color: AppColors.primarySwatchColor,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
