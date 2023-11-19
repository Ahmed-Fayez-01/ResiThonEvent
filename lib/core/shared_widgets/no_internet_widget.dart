import 'package:flutter/material.dart';

import '../utils/colors/colors.dart';
import '../utils/constants.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.signal_wifi_connected_no_internet_4,
          size: 100,
          color: AppColors.primaryColor,),
        SizedBox(height: AppConstants.height15(context),),
        const Center(
          child: Text("NO INTERNET",
            style: TextStyle(
                fontSize: 25
            ),),
        ),
      ],
    );
  }
}
