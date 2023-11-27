import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/features/sessions/presentations/views/widgets/session_evaluation_view_body.dart';


class SessionEvaluationView extends StatelessWidget {
  const SessionEvaluationView({super.key, required this.sessionId});
final int sessionId;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Evaluation Time",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * .018,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          systemNavigationBarColor: Color(0xffEDC907),
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
      ),
      body: SessionEvaluationViewBody(sessionId: sessionId,),
    );
  }
}
