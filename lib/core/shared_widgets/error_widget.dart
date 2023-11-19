import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets/assets.dart';
import '../utils/constants.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key,required this.height,required this.imgWidth});
final double height ;
final double imgWidth ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetData.serverError,width: imgWidth,color: Color(0xffA5A5A5),),
            SizedBox(height: AppConstants.height10(context),),
            const Text("Un Expected Error Please Try again later ",style: TextStyle(
                color: Color(0xffA5A5A5),
                fontFamily: "Poppins"
            ),),
          ],
        ),
      ),
    );
  }
}
