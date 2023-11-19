import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/features/orginizer/food/presentation/views/widgets/food_view_body.dart';

class FoodView extends StatelessWidget {
  const FoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const FoodViewBody(),
    );
  }
}
