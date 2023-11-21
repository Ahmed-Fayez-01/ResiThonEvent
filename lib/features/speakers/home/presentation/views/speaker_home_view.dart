import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/features/speakers/home/presentation/views/widgets/speaker_home_view_body.dart';
import 'package:resithon_event/features/speakers/home/presentation/views/widgets/speaker_side_menu.dart';

import '../../../../notifications/presentation/view_models/notifications_cubit.dart';

class SpeakerHomeView extends StatefulWidget {
  const SpeakerHomeView({super.key});

  @override
  State<SpeakerHomeView> createState() => _SpeakerHomeViewState();
}

class _SpeakerHomeViewState extends State<SpeakerHomeView> {
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
      body: const SpeakerHomeViewBody(),
      drawer: const SpeakerSideMenu(),
    );
  }
}
