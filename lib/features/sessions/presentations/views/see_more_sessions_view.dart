import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/features/sessions/presentations/views/widgets/see_more_sessions_view_body.dart';

class SeeMoreSessionsView extends StatelessWidget {
  const SeeMoreSessionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
            size: MediaQuery.of(context).size.height*.016,
            color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        systemOverlayStyle:  const SystemUiOverlayStyle(
          statusBarColor: Colors.white, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          systemNavigationBarColor:Colors.white,
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        title: Text("sessions".tr(),
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: MediaQuery.of(context).size.height*.018,
              fontWeight: FontWeight.w400,
              color: const Color(0xff323232)
          ),),
      ),
      body: const SeeMoreSessionsViewBody(),
    );
  }
}
