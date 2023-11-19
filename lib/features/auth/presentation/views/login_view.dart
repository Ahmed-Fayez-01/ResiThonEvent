import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop: ()=>exit(0),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0.0), // here the desired height
            child: AppBar(
              elevation: 0,
                systemOverlayStyle:  const SystemUiOverlayStyle(
                  statusBarColor: Colors.white, // <-- SEE HERE
                  statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
                  systemNavigationBarColor: AppColors.primarySwatchColor,
                  statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
                ),
            )
        ),
        body:  const Center(child: LoginViewBody()),
      ),
    );
  }
}
