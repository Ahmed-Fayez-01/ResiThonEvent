import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resithon_event/core/shared_widgets/description_point.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/core/utils/constants.dart';

import '../../features/sessions/data/models/sessions_model.dart';

class AgendaItem extends StatelessWidget {
  const AgendaItem({Key? key, required this.instance, required this.color}) : super(key: key);
  final Data instance;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.height5(context)),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.height * .07,
            height: MediaQuery.of(context).size.height * .07,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  instance.date!.split("-")[2],
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .018,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Colors.white),
                ),
                Text(
                DateFormat("MMMM").format(DateTime(
                int.parse(instance.date!.split(
                "-")[0]),
                int.parse(instance.date!.split(
                "-")[1]),
                int.parse(instance.date!.split(
                "-")[2]))).substring(0,3),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .012,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            width: AppConstants.width10(context),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  instance.name!,
                  style: TextStyle(
                      fontSize: AppConstants.sp14(context),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Colors.white),
                ),
                SizedBox(height: AppConstants.height5(context),),
                DescriptionPoint(
                  iconPath: AssetData.timer,
                  description: "${instance.startTime!} - ${instance.endTime!}",
                  iconColor: Colors.white,
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
