import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/utils/text_styles/styles.dart';

import '../utils/colors/colors.dart';

class UserImageAndName extends StatelessWidget {
  const UserImageAndName({super.key,required this.image,required this.name});
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*.03,
          width: MediaQuery.of(context).size.height*.03,          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.03,),
            color: Colors.grey[300],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.03,),
            child:CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * .07,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: AppColors.greyColor,)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),),
        ),
        SizedBox(
          width: AppConstants.width5(context),
        ),
        Expanded(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.hintText(context).copyWith(
              color: const Color(0xCC323232),
            ),
          ),
        ),
      ],
    );
  }
}
