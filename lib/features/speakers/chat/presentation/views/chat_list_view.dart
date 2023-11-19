import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/features/speakers/chat/presentation/views/widgets/chat_list_view_body.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({Key? key, required this.name, required this.sessionId}) : super(key: key);
  final String name;
  final int sessionId;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
        title: Text(name,
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: MediaQuery.of(context).size.height*.018,
              fontWeight: FontWeight.w400,
              color: const Color(0xff323232)
          ),),
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body:   ChatListViewBody(
        sessionId: sessionId,
        name: name,
      ),
    );
  }
}
