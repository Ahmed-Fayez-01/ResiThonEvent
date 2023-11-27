import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({super.key,required this.onpress});
  Function ()? onpress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onpress,
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x26000000),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: const Icon(Icons.arrow_back_ios_new_outlined, size: 20),
          ),
        )
      ],
    );
  }
}
