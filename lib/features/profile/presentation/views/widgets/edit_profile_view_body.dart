import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:http_parser/http_parser.dart';
import 'package:resithon_event/core/shared_widgets/custom_button.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_helper.dart';
import 'package:resithon_event/features/profile/presentation/view_model/edit_profile/edit_profile_cubit.dart';

import '../../../../../../core/shared_widgets/custom_text_form_filed.dart';
import '../../../../../core/shared_widgets/custom_dialog.dart';
import '../../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../view_model/upload_image_profile/upload_image_profile_cubit.dart';

TextEditingController name = TextEditingController();
TextEditingController bio = TextEditingController();

class EditProfileViewBody extends StatelessWidget {
  EditProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConstants.file = null;

    return Padding(
      padding: EdgeInsets.all(AppConstants.sp20(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocConsumer<UploadImageProfileCubit, UploadImageProfileState>(
            builder: (context, state) {
              var speakerUploadImageProfileCubit =
                  UploadImageProfileCubit.get(context);
              return Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AppConstants.file != null
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * .12,
                            width: MediaQuery.of(context).size.height * .12,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * .12,
                              ),
                              child: Image.file(
                                AppConstants.file!,
                                fit: BoxFit.cover,
                              ),
                            ))
                        : Container(
                            height: MediaQuery.of(context).size.height * .12,
                            width: MediaQuery.of(context).size.height * .12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * .12,
                              ),
                              color: Colors.grey[300],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * .12,
                              ),
                              child: CachedNetworkImage(
                                imageUrl: CacheHelper.getData(key: "image"),
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                  color: AppColors.greyColor,
                                )),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                    InkWell(
                        onTap: () {
                          speakerUploadImageProfileCubit
                              .pickImage(AppConstants.file);
                        },
                        child: const Icon(
                          Icons.camera_alt,
                          color: Color(0xffDCDCDC),
                        )),
                  ],
                ),
              );
            },
            listener: (BuildContext context, state) {
              if (state is UploadImageSuccessState) {
                AppConstants.file = state.image;
              }
            },
          ),
          Text(
            "Name",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              fontSize: AppConstants.sp14(context),
            ),
          ),
          SizedBox(
            height: AppConstants.sp10(context),
          ),
          DefaultTextFormField(
            textInputType: TextInputType.text,
            controller: name,
            hasBorder: false,
            maxLines: 1,
            borderRadius: AppConstants.sp10(context),
          ),
          SizedBox(
            height: AppConstants.sp10(context),
          ),
          Text(
            "Bio",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              fontSize: AppConstants.sp14(context),
            ),
          ),
          SizedBox(
            height: AppConstants.sp10(context),
          ),
          DefaultTextFormField(
            textInputType: TextInputType.text,
            controller: bio,
            hasBorder: false,
            maxLines: 8,
            borderRadius: AppConstants.sp10(context),
          ),
          SizedBox(
            height: AppConstants.sp30(context),
          ),
          BlocConsumer<EditProfileCubit, EditProfileState>(
            builder: (BuildContext context, state) {
              return DefaultButton(
                onPress: () async {
                  if (AppConstants.file != null) {
                    String fileName = AppConstants.file!.path.split("/").last;
                    MultipartFile image = await MultipartFile.fromFile(
                      AppConstants.file!.path,
                      filename: fileName,
                    );
                    context.read<EditProfileCubit>().editUserProfile(
                          name: name.text,
                          image: image,
                          bio: bio.text,
                        );
                  } else {
                    context.read<EditProfileCubit>().editUserProfile(
                          name: name.text,
                          image: null,
                          bio: bio.text,
                        );
                  }
                },
                text: "Update",
                borderRadius: AppConstants.sp10(context),
              );
            },
            listener: (BuildContext context, state) {
              if (state is UserEditProfileSuccessState) {
                customPopUpDialog(
                  context: context,
                  icon: AssetData.book,
                  mainTitle: "profileUpdateMessage".tr(),
                );
                Future.delayed(const Duration(milliseconds: 2000), () {
                  GoRouter.of(context).push("/profileView");
                });
              } else if (state is UserEditProfileErrorState) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errMessage),
                  backgroundColor: Colors.red,
                ));
              } else if (state is UserEditProfileLoadingState) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => WillPopScope(
                    onWillPop: () {
                      return Future.value(false);
                    },
                    child: AlertDialog(
                      insetPadding: const EdgeInsets.all(0),
                      contentPadding: EdgeInsets.zero,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      content: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SpinKitCubeGrid(
                                color: AppColors.primaryColor,
                                size: 40.0,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "loadingLogin".tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
