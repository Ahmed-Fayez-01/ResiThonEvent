import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';

import '../utils/colors/colors.dart';
import '../utils/constants.dart';

class UserDrawerHeader extends StatelessWidget {
  UserDrawerHeader({super.key,required this.name,required this.imagePath,required this.type,this.press});
  final String imagePath;
  final String name;
  final String type;
  Function()? press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*.1,
              width: MediaQuery.of(context).size.height*.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.1,),
                color: Colors.grey[300],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.1,),
                  child:CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * .07,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: AppColors.greyColor,)),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Transform.translate(
                offset:  Offset(0, MediaQuery.of(context).size.height*.009),
                child: GestureDetector(
                  onTap: press,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height * .022,
                    backgroundColor: AppColors.primarySwatchColor,
                    child:  SvgPicture.asset(AssetData.edit,width: MediaQuery.of(context).size.width*.06,),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .018,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins"),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .005,
        ),
        Text(
          type=="1"?"Organizer":type=="2"?"Speaker":type=="3"?"Workshop Participant":type=="4"?"Hackathon Participant":"VIP Participant",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .014,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              color: AppColors.primarySwatchColor),
        ),
      ],),
    );
  }
}
