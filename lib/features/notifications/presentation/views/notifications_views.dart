import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/features/notifications/presentation/views/widgets/speaker_notifications_views_body.dart';

class NotificationsViews extends StatefulWidget {
  const NotificationsViews({Key? key}) : super(key: key);

  @override
  State<NotificationsViews> createState() => _NotificationsViewsState();
}

class _NotificationsViewsState extends State<NotificationsViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: MediaQuery.of(context).size.height * .016,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          systemNavigationBarColor: Colors.white,
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        title: Text(
          "notification".tr(),
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: MediaQuery.of(context).size.height * .018,
              fontWeight: FontWeight.w400,
              color: const Color(0xff323232)),
        ),
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: const NotificationsViewsBody(),
    );
  }
}
