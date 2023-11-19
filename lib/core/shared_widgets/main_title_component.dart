import 'package:flutter/material.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/utils/text_styles/styles.dart';

class MainTitleComponent extends StatelessWidget {
  const MainTitleComponent({super.key,required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.homeMainTitle(context),
        ),
      ],
    );
  }
}
