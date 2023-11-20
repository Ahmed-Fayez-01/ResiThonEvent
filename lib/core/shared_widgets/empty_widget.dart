import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets/assets.dart';
import '../utils/constants.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetData.noParticipant,
            fit: BoxFit.cover,
            width:
            MediaQuery.of(context).size.width * .5,
          ),
          Text(
            "No Notifications Yet !!",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize:
              MediaQuery.of(context).size.height *
                  .016,
              fontFamily: "Poppins",
              color: const Color(0xffA5A5A5),
            ),
          ),
          SizedBox(
            height: AppConstants.height20(context),
          ),
        ],
      ),
    );
  }
}
