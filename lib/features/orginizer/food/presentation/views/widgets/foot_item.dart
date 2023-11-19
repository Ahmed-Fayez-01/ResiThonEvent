import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key,required this.title,required this.imagePath});
  final String imagePath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.sp10(context)),
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            spreadRadius: 0,
            blurRadius: 12,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox( width: double.infinity,child: Image.asset(imagePath,fit: BoxFit.cover,)),
          SizedBox(height: AppConstants.height10(context),),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
              border: Border.all(
                  color: const Color(0xffDCDCDC)
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(AppConstants.sp10(context)),
              child: Text(title,textAlign: TextAlign.center,style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.height*.018,
                  color: const Color(0xffDCDCDC)
              ),),
            ),
          )
        ],
      ),
    );
  }
}
