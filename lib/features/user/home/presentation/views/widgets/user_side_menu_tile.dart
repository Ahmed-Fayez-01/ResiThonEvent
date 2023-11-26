import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_keys.dart';

class UserSideMenuTile extends StatelessWidget {
  const UserSideMenuTile({
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
                height: MediaQuery.of(context).size.height*.06,
                width: isActive ? MediaQuery.of(context).size.width*.59 : 0,
                left: CacheKeysManger.getUserLanguageFromCache()=="ar"?null: 0,
                right: CacheKeysManger.getUserLanguageFromCache()=="ar"?0: null,
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
