import 'package:flutter/material.dart';

import '../utils/colors/colors.dart';

//ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.controller,
    this.obscureText,
    this.icon,
    this.hintText,
    this.onPressed,
    this.onChange,
    this.prefix,
    this.validator,
    this.maxLines,
    this.prefixIcon,
    this.keyboardType,
    this.readOnly,
    this.raduis,
  }) : super(key: key);

  TextEditingController? controller;
  final bool? obscureText;
  Widget? icon;
  Widget? prefixIcon;
  Widget? prefix;
  void Function()? onPressed;
  void Function(String value)? onChange;
  String? hintText;
  int? maxLines;
  double? raduis;
  TextInputType? keyboardType;
 // String? Function(String?)? validator;
  final String? validator;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText ?? false,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChange,
      style: const TextStyle(
        color: Colors.black,
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return validator;
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: icon,
        prefixIcon: prefixIcon,
        prefix: prefix,
        filled: true,
        fillColor: const Color(0xffF3F5FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduis ?? 10),
          borderSide:   const BorderSide(
            color:   Color(0xffF3F5FA),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduis ?? 10),
          borderSide:   const BorderSide(
            color: Color(0xffF3F5FA),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduis ?? 10),
          borderSide:  const  BorderSide(
            color: Color(0xffF3F5FA),
          ),
        ),
        hintText: hintText,
        hintStyle:   TextStyle(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}