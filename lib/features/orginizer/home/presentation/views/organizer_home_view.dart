import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/features/orginizer/home/presentation/views/widgets/organizer_home_view_body.dart';

class OrganizerHomeView extends StatelessWidget {
  const OrganizerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle:  const SystemUiOverlayStyle(
              statusBarColor: Colors.white, // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
              systemNavigationBarColor:Colors.white,
              statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
          )
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: const OrganizerHomeViewBody(),
    );
  }
}
