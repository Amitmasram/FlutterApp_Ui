import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/network_layer/firebase_utils.dart';
import 'package:todo/core/provider/app_provider.dart';
import 'package:todo/pages/settings/widgets/theme_bottom_sheet.dart';

class SettingsViewModel extends ChangeNotifier {
  String _currentUserEmail = "";
  String _changePasswordStatus = "";
  String _deleteAccountStatus = "";

  String? get changePasswordStatus => _changePasswordStatus;

  String? get deleteAccountStatus => _deleteAccountStatus;

  void showThemeBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ThemeBottomSheetWidget(),
    );
  }

  changePassword() async {
    getCurrentUserEmail();
    if (_currentUserEmail.isEmpty) {
      return "failed";
    } else {
      _changePasswordStatus =
          await FirebaseUtils.resetPassword(_currentUserEmail);
      if (_changePasswordStatus.isEmpty) _changePasswordStatus = "invalid";
    }
    logout();
    notifyListeners();
  }

  getCurrentUserEmail() {
    _currentUserEmail = FirebaseUtils.getCurrentUserEmail();
  }

  deleteAccount() async {
    _deleteAccountStatus = await FirebaseUtils.deleteAccount();
    if (_deleteAccountStatus.isEmpty) {
      _deleteAccountStatus = "invalid";
    } else {
      _deleteAccountStatus = "success";
      logout();
    }
    notifyListeners();
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    AppProvider.userID = "";
    await FirebaseUtils.logOut();
  }
}
