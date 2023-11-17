// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

// Utility class to handle theme-related data in shared preferences
class SharedPref {
  // Set the theme ID in shared preferences
  static Future<void> setThemeID({String? value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("AppThemeID", value!);
  }

  // Get the theme ID from shared preferences
  static Future<String> getThemeID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("AppThemeID")!;
  }
}
