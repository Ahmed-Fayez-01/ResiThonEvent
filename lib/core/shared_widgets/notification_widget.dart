import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/colors/colors.dart';
import '../utils/constants.dart';
import 'package:badges/badges.dart' as badges;


//ignore: must_be_immutable
class AppBarIconWidget extends StatelessWidget {
  AppBarIconWidget({super.key,required this.press,required this.iconPath});
  Function () press;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chats').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      // Extract data from the snapshot
      //final data = snapshot.data!.docs.map((doc) => doc.data()).toList();

      return GestureDetector(
        onTap: press,
        child: Container(
          padding:
          EdgeInsets.all(MediaQuery.of(context).size.height * .005),
          decoration: BoxDecoration(
              color: AppColors.primarySwatchColor,
              borderRadius:
              BorderRadius.circular(AppConstants.sp10(context))),
          child: SvgPicture.asset(iconPath,
              width: MediaQuery.of(context).size.width * .06),
        ),
      );
    },
    );
  }
}
