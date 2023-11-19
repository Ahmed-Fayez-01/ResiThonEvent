import 'package:flutter/material.dart';

import '../utils/colors/colors.dart';

class BottomTrailerComponent extends StatelessWidget {
  const BottomTrailerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.02,
      decoration:  BoxDecoration(
          color: AppColors.primarySwatchColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(MediaQuery.of(context).size.width*.20),topLeft: Radius.circular(MediaQuery.of(context).size.width*.20))
      ),
    );
  }
}
