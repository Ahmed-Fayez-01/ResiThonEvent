import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resithon_event/core/shared_widgets/custom_button.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/features/orginizer/scan_qr/presentation/view_models/scan_cubit/scan_cubit.dart';
import 'package:resithon_event/features/orginizer/scan_qr/presentation/views/scan_qr_view.dart';

import '../../../../../../core/utils/colors/colors.dart';

Future AcceptablePopUp({
  required BuildContext context,
  Widget? button,
  required int sessionId,
}) =>
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: BlocBuilder<ScanCubit, ScanState>(
                builder: (BuildContext context, state) {
                  if (state is UserScanSuccessState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppConstants.width20(context)),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .17,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: AppConstants.height20(context),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width: MediaQuery.of(context).size.height *
                                        .12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.height *
                                            .12,
                                      ),
                                      color: Colors.grey[300],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.height *
                                            .12,
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: state.model.data!.image!,
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .12,
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator(
                                          color: AppColors.greyColor,
                                        )),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppConstants.height5(context),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Code  : ",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .02,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppConstants.width5(context),
                                      ),
                                      Text(
                                        "${state.model.data!.id!}",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .02,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Name : ",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .02,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppConstants.width5(context),
                                      ),
                                      Expanded(
                                        child: Text(
                                          state.model.data!.name!,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .02,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Role    : ",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .02,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppConstants.width5(context),
                                      ),
                                      Text(
                                        state.model.data!.type!,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .02,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Lunch Type : ",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Poppins",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .02,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppConstants.width5(context),
                                      ),
                                      Text(
                                        state.model.data!.lunch!,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .02,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: AppConstants.height20(context),),
                                  Column(
                                    children: [
                                      Text(
                                        "Message",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .02,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        state.model.message!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Poppins",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .02,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: AppConstants.height20(context),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.width20(context)),
                          child: button,
                        ),
                        SizedBox(
                          height: AppConstants.height20(context),
                        ),
                      ],
                    );
                  } else if (state is UserScanErrorState) {
                    return Padding(
                      padding: EdgeInsets.all(AppConstants.sp20(context)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            AssetData.qr,
                            width: MediaQuery.of(context).size.width * .2,
                            color: const Color(0xffA5A5A5),
                          ),
                          const Text(
                            "Un Expected Error Please Try again later ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xffA5A5A5), fontFamily: "Poppins"),
                          ),
                          SizedBox(
                            height: AppConstants.height10(context),
                          ),
                          DefaultButton(
                              borderRadius: AppConstants.sp10(context),
                              onPress: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanQrPage(sessionId: sessionId)));
                          }, text: "Okay"),
                        ],
                      ),
                    );
                  } else if (state is UserScanLoadingState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * .24,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              )),
        ),
      ),
    );
