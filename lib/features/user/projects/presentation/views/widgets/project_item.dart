import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_keys.dart';

import '../../../../../../core/utils/colors/colors.dart';
import '../../../../../../core/utils/constants.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.title, required this.imgPath});

  final String imgPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .23,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
              child: CachedNetworkImage(
                imageUrl: imgPath,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.greyColor,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .17,
            height: MediaQuery.of(context).size.height * .23,
            decoration: BoxDecoration(
              borderRadius: CacheKeysManger.getUserLanguageFromCache() == "ar"
                  ? BorderRadius.only(
                      bottomRight: Radius.circular(AppConstants.sp10(context)),
                      topRight: Radius.circular(AppConstants.sp10(context)))
                  : BorderRadius.only(
                      topLeft: Radius.circular(AppConstants.sp10(context)),
                      bottomLeft: Radius.circular(AppConstants.sp10(context))),
              color: Colors.black.withOpacity(.3),
            ),
            child: Row(
              children: <Widget>[
                RotatedBox(
                  quarterTurns: -1,
                  child: Padding(
                    padding: EdgeInsets.all(AppConstants.sp20(context)),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * .016,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
