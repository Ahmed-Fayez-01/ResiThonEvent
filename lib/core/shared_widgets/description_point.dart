import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/utils/text_styles/styles.dart';

class DescriptionPoint extends StatelessWidget {
  const DescriptionPoint({super.key,required this.iconPath,required this.description,this.iconColor,this.textColor});
 final String iconPath;
 final Color? iconColor;
 final Color? textColor;
 final String description;
  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          iconPath,
          color: iconColor,
          width: AppConstants.width20(context),
        ),
        SizedBox(
          width: AppConstants.width5(context),
        ),
        Expanded(
          child: Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Styles.hintText(context).copyWith(
              color: textColor
            ),
          ),
        ),
      ],
    );
  }
}
