import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resithon_event/core/shared_widgets/custom_button.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_helper.dart';
import 'package:resithon_event/features/orginizer/home/data/models/side_menu_data.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/shared_widgets/user_drawer_header.dart';
import 'user_side_menu_tile.dart';

// Welcome to the Episode 5
class UserSideMenu extends StatefulWidget {
  const UserSideMenu({super.key});

  @override
  State<UserSideMenu> createState() => _UserSideMenuState();
}

class _UserSideMenuState extends State<UserSideMenu> {
  Map<String, String> selectedMenu = SideMenuData.sideMenus.first;

  @override
  Widget build(BuildContext context) {
    void launchTelegram() async{

      String url =
          "https://wa.me/%3C+966599003458%3E";
      print("launchingUrl: $url");
      if (await canLaunch(url)) {
        var url = Uri.parse("https://wa.me/%3C+966599003458%3E");
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
        // await launch(url,
        //     mode: LaunchMode.externalApplication);
      }

    }
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      height: double.infinity,
      color: const Color(0xFFF2F2F2),
      child: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            UserDrawerHeader(press: (){
              GoRouter.of(context).push("/profileView");
            },name: CacheHelper.getData(key: "name"), imagePath:  CacheHelper.getData(key: "image"),type: CacheHelper.getData(key: "role"),),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            ...SideMenuData.sideMenus.map(
              (menu) => UserSideMenuTile(
                menu: menu["icon"]!,
                press: () {
                  setState(() {
                    selectedMenu = menu;
                  });
                  Future.delayed(const Duration(milliseconds: 350), () {
                    Scaffold.of(context).closeDrawer();
                    if (selectedMenu["title"] == "Home"||selectedMenu["title"] == "الرئيسية") {
                      Scaffold.of(context).closeDrawer();
                    } else if (selectedMenu["title"] == "My Schedule"||selectedMenu["title"] == "جدولي") {
                      GoRouter.of(context).push("/scheduleView");
                    } else if (selectedMenu["title"] == "Agenda"||selectedMenu["title"] == "الاجنده") {
                      GoRouter.of(context).push("/agendaView");
                    } else if (selectedMenu["title"] == "Final Project"||selectedMenu["title"] == "المشاريع النهائيه") {
                      GoRouter.of(context).push("/projectsView");
                    }else if (selectedMenu["title"] == "Videos"||selectedMenu["title"] == "الفديوهات") {
                      GoRouter.of(context).push("/videosView");
                    }
                    else if (selectedMenu["title"] == "support -what’s app"||selectedMenu["title"] == "واتساب") {
                      launchTelegram();
                    }else{
                      GoRouter.of(context).push("/aboutAppView");
                    }
                  });
                },
                isActive: selectedMenu == menu,
                title: menu["title"]!,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .15),
              child: DefaultButton(
                onPress: () {
                  CacheHelper.removeData(key: "name",);
                  CacheHelper.removeData(key: "image",);
                  CacheHelper.removeData(key: "role",);
                  CacheHelper.removeData(key: "QR",);
                  CacheHelper.removeData(key: "bio",);
                  CacheHelper.removeData(key: "code",);
                  CacheHelper.removeData(key: "can_rate",);
                  CacheHelper.removeData(key: "event_start_day",);
                  CacheHelper.removeData(key: "event_end_day",);
                  CacheHelper.removeData(key: "take_attend_before",);
                  CacheHelper.removeData(key: "stop_take_attend_before",);
                  GoRouter.of(context).go("/loginView");
                },
                text: "signOut".tr(),
                backgroundColor: const Color(0xffC32B43),
                borderRadius: AppConstants.sp10(context),
                height: AppConstants.height15(context),
                icon: SvgPicture.asset(
                  AssetData.signOut,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            )
          ],
        ),
      ),
    );
  }
}
