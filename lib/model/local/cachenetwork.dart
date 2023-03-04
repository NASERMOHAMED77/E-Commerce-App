import 'package:shared_preferences/shared_preferences.dart';

class CacheNetwork {
  static late SharedPreferences sharedPreferences;
  static Future chacheIntializtiaon() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> inserttocache(
      {required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }
   static Future<bool> inserttocacheb(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static String getcachedata({required String key}) {
    return sharedPreferences.getString(key) ?? "";
  }
  static getcachedatab({required String key}) {
    return sharedPreferences.getBool(key) ?? "";
  }

 static  Future<bool> deletecacheitem({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
