import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../../../core/utils/constants.dart';

class MoreDetailsWidget extends StatelessWidget {
  const MoreDetailsWidget(
      {super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .018,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              color: const Color(0xCC323232)),
        ),
        Html(
          data: description,
          style: {
            "p": Style(
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                letterSpacing: 0,
                color: const Color(0xff828282)),
          },
        ),
      ],
    );
  }
}
