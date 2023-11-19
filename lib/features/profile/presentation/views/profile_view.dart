import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_helper.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_keys.dart';
import 'package:resithon_event/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   WillPopScope(
      onWillPop: ()async{
        CacheHelper.getData(key: "role") =="2"? GoRouter.of(context).push("/speakerHomeView"):GoRouter.of(context).push("/userHomeView");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
              size: MediaQuery.of(context).size.height*.016,
              color: Colors.black,),
            onPressed: (){
             CacheHelper.getData(key: "role") =="2"? GoRouter.of(context).push("/speakerHomeView"):GoRouter.of(context).push("/userHomeView");
            },
          ),
          elevation: 0,
          systemOverlayStyle:  const SystemUiOverlayStyle(
            statusBarColor: Colors.white, // <-- SEE HERE
            statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
            systemNavigationBarColor:AppColors.primarySwatchColor,
            statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
          ),
          title: Text("myProfile".tr(),
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: MediaQuery.of(context).size.height*.018,
              fontWeight: FontWeight.w400,
              color: const Color(0xff323232)
            ),),
        ),
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: const ProfileViewBody(),
      ),
    );
  }
}
