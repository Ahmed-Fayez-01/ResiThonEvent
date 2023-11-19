import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/core/utils/constants.dart';

Future customPopUpDialog({
  required BuildContext context,
  Widget? button,
  required String? icon,
  required String? mainTitle,
}) =>
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: ()async=>false,
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          content:  SizedBox(
            width: MediaQuery.of(context).size.width*.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height*.15,
                    decoration: const BoxDecoration(
                      color: Color(0xffF2F2F2)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(AppConstants.sp20(context)),
                      child: SvgPicture.asset(icon!),
                    )),
                SizedBox(height: AppConstants.height20(context),),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                  child: Text(mainTitle!,textAlign: TextAlign.center,style:  TextStyle(
                      fontSize: MediaQuery.of(context).size.height*.02,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xcc323232),
                      fontFamily: 'Poppins'
                  ),),
                ),
                SizedBox(height: AppConstants.height20(context),),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                  child: button,
                ),
                 SizedBox(height: AppConstants.height20(context),),
              ],
            ),
          ),

        ),
      ),);