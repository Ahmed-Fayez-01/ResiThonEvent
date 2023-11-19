import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/core/shared_widgets/custom_button.dart';
import 'package:resithon_event/features/sessions/presentations/views/widgets/session_question_list.dart';

import '../../../../../../core/utils/assets/assets.dart';
import '../../../../../../core/utils/colors/colors.dart';
import '../../../../../../core/utils/constants.dart';
import '../../view_models/post_session_evaluation_cubit/post_session_evaluation_cubit.dart';

class SessionEvaluationViewBody extends StatelessWidget {
  const SessionEvaluationViewBody({super.key, required this.sessionId});
final int sessionId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Text(
                        "It’s ",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * .018,
                        ),
                      ),
                      Text(
                        "time",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.height * .018,
                            color: AppColors.primarySwatchColor),
                      ),
                      Text(
                        " to ",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * .018,
                        ),
                      ),
                      Text(
                        "evaluation",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.height * .018,
                            color: AppColors.primarySwatchColor),
                      ),
                    ],
                  )),
                  SvgPicture.asset(
                    AssetData.evaluationBanner,
                    width: MediaQuery.of(context).size.width * .3,
                  ),
                ],
              ),
              SizedBox(
                height: AppConstants.height20(context),
              ),
              SessionQuestionList(sessionId: sessionId,),
              BlocConsumer<PostSessionEvaluationCubit,
                  PostSessionEvaluationState>(
                builder: (BuildContext context, state) {
                  return DefaultButton(
                      onPress: () {
                        context
                            .read<PostSessionEvaluationCubit>()
                            .postSessionEvaluationDetails(
                                data: AppConstants.evaluationSubmit);
                      },
                      text: "Submit");
                },
                listener: (BuildContext context, state) {
                  if (state is UserPostSessionEvaluationSuccessState) {
                    Navigator.pop(context);
                  } else if (state is UserPostSessionEvaluationErrorState) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.errMessage),
                      backgroundColor: Colors.red,
                    ));
                  } else if (state is UserPostSessionEvaluationLoadingState) {
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
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
        ),
      ],
    );
  }
}
