import 'cache_helper.dart';

class CacheKeysManger {
  static bool onBoardingStatus() =>
      CacheHelper.getData(key: 'onBoarding') ?? false;
  static bool logOutStatus() =>
      CacheHelper.getData(key: 'logout') ?? false;
  static bool firstLanguageSelectionStatus() =>
      CacheHelper.getData(key: 'languageSelected') ?? false;
  static String? getUserDeviceTokenFromCache() =>
      CacheHelper.getData(key: 'device_token');
  static String? getUserCodeFromCache() =>
      CacheHelper.getData(key: 'code')??"";
  static String? getUserEmailFromCache() =>
      CacheHelper.getData(key: 'email')??"";
  static int? getUserIdFromCache() =>
      CacheHelper.getData(key: 'id')?? 0;
  static String? getUserNameFromCache() =>
      CacheHelper.getData(key: 'name')?? "";
  static String? getUserLanguageFromCache() =>
      CacheHelper.getData(key: 'language')?? "";

}
