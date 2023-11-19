import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/core/shared_widgets/user_image_and_name.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/utils/text_styles/styles.dart';

import '../../features/sessions/data/models/sessions_model.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({super.key,required this.instance});
  final Data? instance;
  @override
  Widget build(BuildContext context) {
    var list = List<Widget>.generate(instance!.participants!.length, (i) => Container(
      height: MediaQuery.of(context).size.height*.03,
      width: MediaQuery.of(context).size.height*.03,          decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.03,),
      color: Colors.grey[300],
    ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.03,),
        child:CachedNetworkImage(
          imageUrl: instance!.participants![i].image!,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * .07,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: AppColors.greyColor,)),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),),
    ),);
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Column(
        children: [
          Row(children: [
            Text(instance!.startTime!,style: TextStyle(
              fontSize: MediaQuery.of(context).size.height*.016,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              color: const Color(0xCC323232)
            ),),
            Expanded(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.width10(context)),
              child: Container(
                height: 1,
                decoration: const BoxDecoration(
                  color: Color(0xffDCDCDC),
                ),
              ),
            ),),
            Text(instance!.endTime!,style: TextStyle(
                fontSize: MediaQuery.of(context).size.height*.016,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                color: const Color(0xffA5A5A5)
            ),),
          ],),
          SizedBox(height: AppConstants.height10(context),),
          Container(
            height: MediaQuery.of(context).size.height*.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
              border: Border.all(color: const Color(0xffDCDCDC)),
              color: Colors.white,
            ),
            child: Padding(
              padding:  EdgeInsets.all(AppConstants.sp10(context)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    instance!.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.eventSessionTitle(context),
                  ),
                  SizedBox(
                    height: AppConstants.height10(context),
                  ),
                  UserImageAndName(image: instance!.speaker_image!, name: instance!.speaker!,),
                  SizedBox(
                    height: AppConstants.height10(context),
                  ),
                  Row(
                    children: [
                      instance!.participants!.isNotEmpty?FlutterImageStack.widgets(
                        showTotalCount: true,
                        totalCount: instance!.participants!.length,
                        itemRadius: MediaQuery.of(context).size.height*.035,
                        // Radius of each images
                        itemCount: 3,
                        // Maximum number of images to be shown in stack
                        itemBorderWidth: 1,
                        itemBorderColor: AppColors.primarySwatchColor,
                        extraCountTextStyle:  TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height*.012,
                        ),
                        backgroundColor: AppColors.primarySwatchColor,
                        children: list,
                        // Border width around the images
                      ):const SizedBox(),
                      const Spacer(),
                     Container(
                       padding: EdgeInsets.all(MediaQuery.of(context).size.height*.01),
                       decoration: BoxDecoration(
                         color: AppColors.primarySwatchColor,
                         borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                       ),
                       child: Row(
                         children: [
                           SvgPicture.asset(AssetData.sessionClock,width:  MediaQuery.of(context).size.width*.04,),
                           SizedBox(width: AppConstants.width5(context),),
                           Text("${DateTime.parse(
                               "${instance!.date} ${instance!.endTime}")
                               .difference(DateTime.parse(
                               "${instance!.date} ${instance!.startTime}")).inHours} H",style: TextStyle(
                             fontFamily: "Poppins",
                             fontWeight: FontWeight.w400,
                             fontSize: MediaQuery.of(context).size.height*.014,
                             color: Colors.white
                           ),),
                         ],
                       ),
                     )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
