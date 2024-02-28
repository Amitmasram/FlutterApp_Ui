import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network_layer/firebase_utils.dart';
import '../../layout/home_layout.dart';
import '../../pages/login_view/login_view.dart';

class AppProvider extends ChangeNotifier {
  SharedPreferences prefs;
  static ThemeMode? currentTheme;
  static String userID = "";

  AppProvider(this.prefs) {
    userID = prefs.getString("UID") ?? "";
    bool isDark = prefs.getBool("isDark") ?? false;
    currentTheme = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  logging() {
    if (userID.isEmpty) {
      return LoginView.routeName;
    }
    return HomeLayout.routeName;
  }

  logOut() async {
    userID = "";
    prefs.setString("UID", "");
    await FirebaseUtils.logOut();
  }

  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    addThemeValueToSharedPrefs(currentTheme == ThemeMode.dark);
    notifyListeners();
  }

  addThemeValueToSharedPrefs(bool isDark) {
    isDark ? prefs.setBool("isDark", true) : prefs.setBool("isDark", false);
  }

  isDarkMode() => currentTheme == ThemeMode.dark;
}
