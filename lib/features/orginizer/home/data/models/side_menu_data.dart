import 'package:easy_localization/easy_localization.dart';
import 'package:resithon_event/core/utils/assets/assets.dart';

class SideMenuData{
  static List<Map<String,String>> sideMenus = [
    {
      "icon":AssetData.home,
      "title":"home".tr(),
    },
    {
      "icon": AssetData.schedule,
      "title":"mySchedule".tr(),
    },
    {
      "icon":AssetData.calender,
      "title":"agenda".tr(),
    },
    {
      "icon": AssetData.projects,
      "title":"finalProject".tr(),
    },
    {
      "icon": AssetData.videos,
      "title":"videos".tr(),
    },
    // {
    //   "icon": AssetData.whatsApp,
    //   "title":"WhatsApp".tr(),
    // },
    {
      "icon":AssetData.aboutApp,
      "title":"aboutApp".tr(),
    },

  ];
  static List<Map<String,String>> speakerSideMenus = [
    {
      "icon":AssetData.home,
      "title":"home".tr(),
    },
    {
      "icon": AssetData.schedule,
      "title":"mySchedule".tr(),
    },
    {
      "icon": AssetData.calender,
      "title":"agenda".tr(),
    },
    {
      "icon": AssetData.videos,
      "title":"videos".tr(),
    },
    {
      "icon":AssetData.aboutApp,
      "title":"aboutApp".tr(),
    },


  ];
}