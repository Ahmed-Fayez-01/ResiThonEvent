import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resithon_event/core/shared_widgets/custom_back_button.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/features/about_app/presentation/views/widgets/contact_us.dart';
import 'package:resithon_event/features/about_app/presentation/views/widgets/version.dart';
import '../../../../../core/shared_widgets/logo_text.dart';
import 'about_info_point.dart';

class AboutAppViewBody extends StatelessWidget {
  const AboutAppViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.sp20(context)),
      child: Column(
        children: [
          const CustomBackButton(),
          LogoText(),
          SizedBox(
            height: AppConstants.height20(context),
          ),
          Text(
            "aboutDescription".tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              fontSize: MediaQuery.of(context).size.height * .016,
              color: const Color(0xff828282),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*.06,),
          const Version(),
          SizedBox(height: MediaQuery.of(context).size.height*.06,),
          AboutInfoPoint(title: 'Resithon@gmail.com', iconPath: AssetData.email, subTitle: 'emailText'.tr(),),
          SizedBox(height: AppConstants.height10(context),),
          AboutInfoPoint(title: '01XXXXXXXXX', iconPath: AssetData.phone, subTitle: 'phoneText'.tr(),),
          const Expanded(
            child: ContactUs(),
          )
        ],
      ),
    );
  }
}
