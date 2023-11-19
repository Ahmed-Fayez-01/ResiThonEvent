import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ParticipantTitle extends StatelessWidget {
  const ParticipantTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          "participant".tr(),
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height*.018,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              color: const Color(0xCC323232)),
        ),
      ],
    );
  }
}
