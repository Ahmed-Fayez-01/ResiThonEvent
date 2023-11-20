import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/features/sessions/presentations/views/widgets/session_evaluation_view_body.dart';


class SessionEvaluationView extends StatelessWidget {
  const SessionEvaluationView({super.key, required this.sessionId});
final int sessionId;
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
      body: SessionEvaluationViewBody(sessionId: sessionId,),
    );
  }
}
