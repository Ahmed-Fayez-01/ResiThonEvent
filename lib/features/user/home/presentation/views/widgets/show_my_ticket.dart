import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:resithon_event/core/utils/constants.dart';

import '../../../../../../core/utils/colors/colors.dart';

Future showMyTicket({
  required BuildContext context,
  required String code,
  required Widget? button,
}) =>
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: ()async=>false,
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          content:  SizedBox(
            width: MediaQuery.of(context).size.width*.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height*.35,
                    decoration: const BoxDecoration(
                        color: Color(0xffF2F2F2)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(AppConstants.sp20(context)),
                      child:  Center(
                        child: QrImageView(
                          data: code,
                          version: QrVersions.auto,
                          size: MediaQuery.of(context).size.width*.6,
                        ),
                        ),

                      // CachedNetworkImage(
                      //   imageUrl: ticketImagePath,
                      //   fit: BoxFit.cover,
                      //   width: double.infinity,
                      //   height: MediaQuery.of(context).size.height * .14,
                      //   placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: AppColors.greyColor,)),
                      //   errorWidget: (context, url, error) => const Icon(Icons.error),
                      // ),
                    )),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                  child: button,
                ),
                SizedBox(height: AppConstants.height20(context),),
              ],
            ),
          ),

        ),
      ),);