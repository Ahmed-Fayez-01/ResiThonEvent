import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resithon_event/core/utils/constants.dart';

class SpeakerSideMenuTile extends StatelessWidget {
  const SpeakerSideMenuTile({
    Key? key,
    required this.menu,
    required this.press,
    required this.title,
    required this.isActive,
  }) : super(key: key);

  final String menu;
  final VoidCallback press;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Column(
        children: [
          Stack(
            children: [
              // This is what we wanted
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn,
                // Much better
                height: MediaQuery.of(context).size.height*.065,
                width: isActive ? MediaQuery.of(context).size.width*.60 : 0,
                left: 0,
                child: Container(
                  decoration:  BoxDecoration(
                    color: const Color(0xFF1F4097),
                    borderRadius: BorderRadius.all(Radius.circular(AppConstants.sp10(context))),
                  ),
                ),
              ),
              ListTile(
                onTap: press,
                leading: SizedBox(
                  height: AppConstants.height20(context),
                  width: AppConstants.height20(context),
                  child: SvgPicture.asset(
                    menu,
                    color: isActive?Colors.white:const Color(0xffA5A5A5),
                  ),
                ),
                title: Text(
                  title,
                  style: TextStyle(color: isActive?Colors.white:const Color(0xffA5A5A5)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
