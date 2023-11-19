import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/features/sessions/presentations/views/widgets/session_details_view_body.dart';

import '../../data/models/sessions_model.dart';

class UserSessionDetailsView extends StatelessWidget {
  const UserSessionDetailsView({super.key,required this.id});
final int id;
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
              systemNavigationBarColor: Color(0xff323232),
              statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
          )
      ),
      body: UserSessionDetailsViewBody(id: id,),

    );
  }
}
