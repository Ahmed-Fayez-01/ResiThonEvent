import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors/colors.dart';
import '../../../../../../core/utils/constants.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key,required this.imagePath,required this.name,required this.type});
  final String imagePath;
  final String name;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*.12,
          width: MediaQuery.of(context).size.height*.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.12,),
            color: Colors.grey[300],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.12,),
            child:CachedNetworkImage(
              imageUrl: imagePath,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * .07,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: AppColors.greyColor,)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),),
        ),
        SizedBox(
          height: AppConstants.height10(context),
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: AppConstants.sp20(context),
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins"
          ),
        ),
        SizedBox(
          height: AppConstants.height5(context),
        ),
        Text(
          type=="1"?"Organizer":type=="2"?"Speaker":type=="3"?"WorkShopper":type=="4"?"Hackathon":"VIP",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppConstants.sp14(context),
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
