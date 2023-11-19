import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/features/splash/presentation/views/widgets/slash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
//fayez
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle:  const SystemUiOverlayStyle(
              statusBarColor: AppColors.primarySwatchColor, // <-- SEE HERE
              statusBarIconBrightness: Brightness.light, //<-- For Android SEE HERE (dark icons)
              systemNavigationBarColor: AppColors.primarySwatchColor,
              statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
            ),
          )
      ),
      body: const SplashViewBody(),
    );
  }
}
