import 'package:cached_network_image/cached_network_image.dart';
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
                  int.parse(instance.startTime!.split(":")[0]) > 12
                      ? "${int.parse(instance.startTime!.split(":")[0])-12}:${instance.startTime!.split(":")[1]}"
                      : "${instance.startTime!.split(":")[0]}:${instance.startTime!.split(":")[1]}",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .018,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      color: Colors.white),
                ),
                Text(
                  int.parse(instance.startTime!.split(":")[0]) >= 12?"PM":"AM",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .014,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                      color: Colors.white),
                ),
              ],
            ),
          ),
          // ClipRRect(
          //     borderRadius:  BorderRadius.only(
          //         topLeft: Radius.circular(AppConstants.sp10(context)),
          //         bottomLeft:
          //         Radius.circular(AppConstants.sp10(context))),
          //     child: Container(
          //       color: Colors.grey,
          //       child: CachedNetworkImage(
          //         imageUrl: instance.image!,
          //           fit: BoxFit.fill,
          //         width: MediaQuery.of(context).size.width * .22,
          //         height: MediaQuery.of(context).size.height * .1,
          //         placeholder: (context, url) => const Center(
          //             child: CircularProgressIndicator(
          //               color: AppColors.greyColor,
          //             )),
          //         errorWidget: (context, url, error) => const Icon(Icons.error),
          //       ),
          //     )),
          SizedBox(
            width: AppConstants.width10(context),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: AppConstants.width10(context)),
                  child: Text(
                    instance.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: AppConstants.sp14(context),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: AppConstants.height10(context),
                ),
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
