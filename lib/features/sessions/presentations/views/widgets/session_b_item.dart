import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resithon_event/core/shared_widgets/description_point.dart';
import 'package:resithon_event/core/shared_widgets/user_image_and_name.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/constants.dart';

import '../../../../../../core/utils/text_styles/styles.dart';
import 'package:resithon_event/features/sessions/data/models/sessions_model.dart';

import '../../../../../core/utils/colors/colors.dart';

class SessionBWidget extends StatefulWidget {
  const SessionBWidget({super.key, required this.instance});

  final Data? instance;

  @override
  State<SessionBWidget> createState() => _SessionBWidgetState();
}

class _SessionBWidgetState extends State<SessionBWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Container(
        height: MediaQuery.of(context).size.height * .24,
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
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .14,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppConstants.sp10(context)),
                          topRight:
                              Radius.circular(AppConstants.sp10(context))),
                      child: CachedNetworkImage(
                        imageUrl: widget.instance!.image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                          color: AppColors.greyColor,
                        )),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppConstants.sp10(context)),
                      topRight: Radius.circular(AppConstants.sp10(context))),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .14,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppConstants.sp10(context)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .01,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.width20(context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppConstants.sp10(context)),
                          decoration: BoxDecoration(
                            color: widget.instance!.count! <
                                        int.parse(
                                            widget.instance!.totalCount!) &&
                                    !widget.instance!.reservation_expire!
                                ? const Color(0xff27AE60)
                                : AppColors.greyColor,
                            borderRadius: BorderRadius.circular(
                                AppConstants.sp10(context)),
                          ),
                          child: Text(
                            widget.instance!.count! <
                                        int.parse(
                                            widget.instance!.totalCount!) &&
                                    !widget.instance!.reservation_expire!
                                ? "Available"
                                : widget.instance!.count! <
                                            int.parse(
                                                widget.instance!.totalCount!) &&
                                        widget.instance!.reservation_expire!
                                    ? "Not Available"
                                    : "Completed",
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.height20(context),
                        vertical: AppConstants.height10(context)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.instance!.name!,
                          style: Styles.eventSessionTitle(context)
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppConstants.height10(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.width20(context)),
              child: UserImageAndName(
                  image: widget.instance!.speaker_image!,
                  name: widget.instance!.speaker!),
            ),
            SizedBox(
              height: AppConstants.height15(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.height20(context)),
              child: Row(
                children: [
                  Expanded(
                    child: DescriptionPoint(
                      iconPath: AssetData.location,
                      description: widget.instance!.venue!,
                    ),
                  ),
                  SizedBox(
                    width: AppConstants.width10(context),
                  ),
                  Expanded(
                    child: DescriptionPoint(
                      iconPath: AssetData.calender,
                      description: widget.instance!.date!,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
