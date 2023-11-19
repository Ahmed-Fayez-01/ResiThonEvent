import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/constants.dart';

import '../../../../../../core/utils/colors/colors.dart';

class SendMsgButton extends StatelessWidget {
  const SendMsgButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding:  EdgeInsets.all(AppConstants.sp10(context)),
      height: MediaQuery.of(context).size.height*.06,
      width: MediaQuery.of(context).size.height*.06,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
      ),
      child: SvgPicture.asset(AssetData.sendMsg,),
    );
  }
}
