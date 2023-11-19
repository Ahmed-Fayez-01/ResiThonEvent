import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors/colors.dart';
import '../../../../../../core/utils/constants.dart';

class TicketInfo extends StatelessWidget {
  const TicketInfo({super.key,required this.imagePath,required this.name,required this.ticketType});
  final String imagePath;
  final String name;
  final String ticketType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: MediaQuery.of(context).size.height*.04,backgroundImage: AssetImage(imagePath),),
        SizedBox(height: AppConstants.height10(context),),
        Text(name,style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*.016,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            color: const Color(0xcc323232)
        ),),
        SizedBox(height: AppConstants.height10(context),),
        Text(ticketType,style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*.016,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            color: AppColors.primarySwatchColor
        ),),
      ],
    );
  }
}
