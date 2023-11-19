import 'package:flutter/material.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';

class ProgressDots extends StatelessWidget {
  ProgressDots({super.key, required this.isActiveScreen});
  bool isActiveScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.01),
      height:  MediaQuery.of(context).size.width*.02,
      width:   MediaQuery.of(context).size.width*.02,
      decoration: BoxDecoration(
          color: isActiveScreen ?  AppColors.primarySwatchColor : const Color(0xffDCDCDC),
          borderRadius:  BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width*.01))),
    );
  }
}

