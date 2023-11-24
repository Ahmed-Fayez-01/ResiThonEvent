import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/features/speakers/chat/presentation/views/widgets/speaker_chat_view_body.dart';

import '../../../../../core/shared_widgets/no_internet_widget.dart';
import '../../../../../core/utils/constants.dart';

class SpeakerChatView extends StatelessWidget {
  const SpeakerChatView({Key? key, required this.userType}) : super(key: key);
  final String userType;
  @override
  Widget build(BuildContext context) {
    print(userType);
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios,
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
        title: Text("messages".tr(),
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: MediaQuery.of(context).size.height*.018,
              fontWeight: FontWeight.w400,
              color: const Color(0xff323232)
          ),),
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body:
      const SpeakerChatViewBody()
    );
  }
}
