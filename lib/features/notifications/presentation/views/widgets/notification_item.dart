import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/features/notifications/data/models/notifications_model.dart';

import '../../../../../../core/utils/colors/colors.dart';
import '../../../../../../core/utils/constants.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.notificationsModel}) : super(key: key);
  final Data? notificationsModel;
  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        Container(
         // height: AppConstants.height55(context),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: MediaQuery.of(context).size.height*.06,
              //   width: MediaQuery.of(context).size.height*.06,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.03,),
              //   ),
              //   child: ClipRRect(
              //       borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.03,),
              //       child: Image.asset(
              //         "assets/images/man.jpg",
              //         fit: BoxFit.cover,
              //       )),
              // ),
              // SizedBox(
              //   width: AppConstants.width10(context),
              // ),
              Expanded(
                flex : 6 ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${notificationsModel!.title}",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        fontSize: AppConstants.sp14(context),
                      ),
                    ),
                    SizedBox(height: AppConstants.height5(context),),
                   Text(
                     "${notificationsModel!.message}",
                     style: TextStyle(
                         fontWeight: FontWeight.w400,
                         fontFamily: "Poppins",
                         fontSize: AppConstants.sp10(context),
                         color: AppColors.primaryColor),
                   ),
                  ],
                ),
              ),
              const Spacer(),
             Expanded(
               flex: 1,
               child:  Text(
               "${notificationsModel!.date}",
               style: TextStyle(
                 fontWeight: FontWeight.w400,
                 fontSize: MediaQuery.of(context).size.height*.014,
                 fontFamily: "Poppins",
                 color: AppColors.greyColor,
               ),
             ),),
            ],
          ),
        ),
        const Divider(color: Color(0xffF2F2F2),),
      ],
    );
  }
}
