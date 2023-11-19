import 'package:flutter/material.dart';
import '../colors/colors.dart';

abstract class Styles{
  static TextStyle splashTitle(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.04,
    fontWeight: FontWeight.w700,
    fontFamily: "Poppins",
  );
  static TextStyle onboardingBigTitleText(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.045,
    fontWeight: FontWeight.w700,
    color: const Color(0xffF2F2F2),
    fontFamily: "Poppins",
  );
  static TextStyle onboardingTitleText(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.025,
    fontWeight: FontWeight.bold,
    color: AppColors.secondaryColor,
    fontFamily: "Poppins",
  );
  static TextStyle onBoardingDescriptionText(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.018,
    fontWeight: FontWeight.w500,
    color: AppColors.primarySwatchColor,
    fontFamily: "Poppins",
  );
  static TextStyle descriptionGrey(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.016,
    fontWeight: FontWeight.w400,
    color: const Color(0xff828282),
    fontFamily: "Poppins",
  );
  static TextStyle hintText(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.015,
    fontWeight: FontWeight.w400,
    color: const Color(0xffA5A5A5),
    fontFamily: "Poppins",
  );

  static TextStyle homeMainTitle(context)=> TextStyle(
      fontSize: MediaQuery.of(context).size.height*.022,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins");
  static TextStyle eventSessionTitle(context)=> TextStyle(
      fontSize: MediaQuery.of(context).size.height*.019,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins");

}