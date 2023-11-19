import 'package:flutter/material.dart';
import 'package:resithon_event/core/utils/constants.dart';
import '../utils/colors/colors.dart';

class DefaultButton extends StatelessWidget {
  void Function()? onPress;
  String text;
  Widget? icon;
  double? borderRadius;
  double? height;
  double? fontSize;
  String? fontFamily;
  Color? backgroundColor;
  Color? textColor;
  bool hasBorder;

  DefaultButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.icon,
    this.borderRadius,
    this.height,
    this.fontFamily,
    this.fontSize,
    this.backgroundColor,
    this.textColor,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          padding: EdgeInsets.symmetric(vertical: height ?? AppConstants.height20(context)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 0,
            ),
          )),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize ?? MediaQuery.of(context).size.height*.018,
                  fontFamily: fontFamily??"Poppins")),
          SizedBox(width: AppConstants.width5(context),),
          if (icon != null) ...[
            const SizedBox(
              width: 5,
            ),
            icon!,
            const SizedBox(
              width: 3,
            ),
          ],
        ],
      ),
    );
  }
}
