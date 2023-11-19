import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:resithon_event/core/shared_widgets/description_point.dart';
import 'package:resithon_event/core/shared_widgets/user_image_and_name.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_keys.dart';
import 'package:resithon_event/core/utils/text_styles/styles.dart';
import 'package:resithon_event/features/sessions/data/models/sessions_model.dart';

class SessionItem extends StatelessWidget {
  const SessionItem({super.key, required this.instance});

  final Data? instance;

  @override
  Widget build(BuildContext context) {
    var list = List<Widget>.generate(
      instance!.participants!.length,
      (i) => Container(
        height: MediaQuery.of(context).size.height * .03,
        width: MediaQuery.of(context).size.height * .03,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height * .03,
          ),
          color: Colors.grey[300],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height * .03,
          ),
          child: CachedNetworkImage(
            imageUrl: instance!.participants![i].image!,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * .07,
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
              color: AppColors.greyColor,
            )),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Container(
        height: MediaQuery.of(context).size.height * .15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              spreadRadius: 0,
              blurRadius: 12,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: CacheKeysManger.getUserLanguageFromCache() == "ar"
                    ? BorderRadius.only(
                        bottomRight: Radius.circular(AppConstants.sp10(context)),
                        topRight: Radius.circular(AppConstants.sp10(context)))
                    : BorderRadius.only(
                        topLeft: Radius.circular(AppConstants.sp10(context)),
                        bottomLeft:
                            Radius.circular(AppConstants.sp10(context))),
                child: Container(
                  color: Colors.grey,
                  child: CachedNetworkImage(
                    imageUrl: instance!.image!,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width * .3,
                    height: MediaQuery.of(context).size.height * .15,
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.greyColor,
                    )),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppConstants.sp10(context)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            instance!.name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.eventSessionTitle(context),
                          ),
                        ),
                        SizedBox(
                          width: AppConstants.width15(context),
                        ),
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.height * .015,
                          backgroundColor: instance!.count! < int.parse(instance!.totalCount!)
                              ? Colors.green
                              : AppColors.greyColor,
                          child: Text(
                            "A",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * .015),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppConstants.height10(context),
                    ),
                    UserImageAndName(
                      image: instance!.speaker_image!,
                      name: instance!.speaker!,
                    ),
                    SizedBox(
                      height: AppConstants.height10(context),
                    ),
                    Row(
                      children: [
                        instance!.participants!.isNotEmpty
                            ? Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * .035,
                                child: Row(
                                  children: [
                                    FlutterImageStack.widgets(
                                        showTotalCount: true,
                                        totalCount: instance!.participants!.length,
                                        itemRadius:
                                            MediaQuery.of(context).size.height * .035,
                                        // Radius of each images
                                        itemCount: 3,
                                        // Maximum number of images to be shown in stack
                                        itemBorderWidth: 1,
                                        itemBorderColor: AppColors.primarySwatchColor,
                                        extraCountTextStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              MediaQuery.of(context).size.height * .012,
                                        ),
                                        backgroundColor: AppColors.primarySwatchColor,
                                        children: list,
                                        // Border width around the images
                                      ),
                                  ],
                                ),
                              ),
                            )
                            : const SizedBox(),
                       SizedBox(width: AppConstants.width10(context),),
                        Expanded(
                          child: DescriptionPoint(
                            iconPath: AssetData.timer,
                            description: instance!.startTime!,
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
      ),
    );
  }
}
