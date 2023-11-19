import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:resithon_event/core/shared_widgets/logo_text.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/features/sessions/presentations/view_models/all_sessions_cubit/all_sessions_cubit.dart';
import 'package:resithon_event/features/sessions/presentations/view_models/subscribed_sessions_cubit/subscribed_sessions_cubit.dart';
import 'package:resithon_event/features/user/home/presentation/view_models/event_cubit/event_cubit.dart';
import 'package:resithon_event/features/user/projects/presentation/view_models/projects_cubit/all_projects_cubit.dart';
import '../../../../../core/shared_widgets/bottom_trailer_component.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/simple_account_menu.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/services/local_services/cache_helper.dart';
import '../../../../../core/utils/text_styles/styles.dart';
import '../../../../agenda/presentation/view_models/dated_all_sessions_cubit/dated_all_sessions_cubit.dart';
import '../../../../my_schedule/presentation/view_models/dated_subscribed_sessions.cubit/dated_subscribed_sessions_cubit.dart';
import '../../view_models/login_cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController otpCode = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.sp20(context)),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TapRegion(
                  child: SimpleAccountMenu(
                    borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                    backgroundColor: const Color(0xffF3F5FA),
                    iconsText:  [
                      Padding(
                        padding: EdgeInsets.all(AppConstants.height5(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: CountryFlag.fromCountryCode(
                                'US',
                                height: AppConstants.width30(context),
                                width: AppConstants.height20(context),
                                borderRadius: AppConstants.sp10(context),
                              ),
                            ),
                            // const SizedBox(width: 10,),
                            // const Text("English",style: TextStyle(
                            //     color: Colors.white
                            // ),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppConstants.height5(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: CountryFlag.fromCountryCode(
                                'SA',
                                height: AppConstants.width30(context),
                                width: AppConstants.height20(context),
                                borderRadius: AppConstants.sp10(context),
                              ),
                            ),
                            // const SizedBox(width: 10,),
                            // const Text("العربية",style: TextStyle(
                            //     color: Colors.white
                            // ),),
                          ],
                        ),
                      ),

                    ],
                    iconColor: Colors.white,
                    onChange: (index) {
                      if(index==0)
                      {
                        setState(() {
                          context.setLocale(const Locale("en"));
                          CacheHelper.saveData(key: "language", value: "en");
                        });

                      }else{
                        setState(() {
                          context.setLocale(const Locale("ar"));
                          CacheHelper.saveData(key: "language", value: "ar");
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LogoText(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                ),
                Text("uniqeCode".tr()),
                SizedBox(
                  height: AppConstants.height10(context),
                ),
                Text(
                  "sendCode".tr(),
                  style: Styles.descriptionGrey(context),
                ),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.width10(context)),
                    child: PinCodeTextField(
                      length: 5,
                      appContext: context,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * .02),
                          borderWidth: 1,
                          fieldHeight: MediaQuery.of(context).size.height * .06,
                          fieldWidth: MediaQuery.of(context).size.height * .06,
                          activeFillColor: const Color(0xffF3F5FA),
                          inactiveColor: const Color(0xffF3F5FA),
                          inactiveFillColor: const Color(0xffF3F5FA),
                          activeColor: const Color(0xff1F4097),
                          selectedFillColor: const Color(0xffF3F5FA),
                          selectedColor: AppColors.secondaryColor),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "emptyOTP".tr();
                        } else if (value.length < 5) {
                          return "numberOfDigitOTP".tr();
                        }
                        //  else if (value != "12345") {
                        //   return "identicalOTP".tr();
                        // }
                      },
                      controller: otpCode,
                      onCompleted: (v) {},
                      onChanged: (value) {
                        debugPrint(value);
                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: AppConstants.height10(context),
                ),
                BlocConsumer<LoginCubit, LoginState>(
                  builder: (BuildContext context, state) {
                    return DefaultButton(
                      height: MediaQuery.of(context).size.height*.017,
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            print("otp:${otpCode.text}");
                           context.read<LoginCubit>().loginUser(code: otpCode.text);
                          }
                        },
                        text: 'login'.tr(),
                        borderRadius: AppConstants.sp10(context));
                  },
                  listener: (BuildContext context, state) {
                    if (state is UserLoginSuccessState) {
                      context.read<AllSessionsCubit>().sessionsDetails();
                      context.read<EventCubit>().eventDetails();
                      context.read<SubscribedSessionsCubit>().subscribedSessionsDetails();
                      context.read<AllProjectsCubit>().allProjectsDetails();
                      context.read<DatedAllSessionsCubit>().datedAllSessionsDetails(query: {
                        "date":DateFormat('yyyy-MM-dd').format(DateTime.now()),
                      });
                      context.read<DatedSubscribedSessionsCubit>().datedSubscribedSessionsDetails(query: {
                        "date":DateFormat('yyyy-MM-dd').format(DateTime.now()),
                      });
                     if(CacheHelper.getData(key: "role")=="1")
                       {
                         GoRouter.of(context).go("/organizerHomeView");
                       }else if(CacheHelper.getData(key: "role")=="2")
                         {
                           GoRouter.of(context).go("/speakerHomeView");
                         }else
                           {
                             GoRouter.of(context).go("/userHomeView");
                           }
                    } else if (state is UserLoginErrorState) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.errMessage),
                        backgroundColor: Colors.red,
                      ));
                    } else if (state is UserLoginLoadingState) {
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
          ),
        ),
        const BottomTrailerComponent(),
      ],
    );
  }
}
