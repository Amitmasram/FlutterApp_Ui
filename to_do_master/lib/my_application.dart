import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'core/provider/app_provider.dart';
import 'core/theme/application_theme.dart';
import 'layout/home_layout.dart';
import 'pages/home_view/edit_task.dart';
import 'pages/login_view/login_view.dart';
import 'pages/register_view/register_view.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do",
      themeMode: AppProvider.currentTheme,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      initialRoute: appProvider.logging(),
      routes: {
        LoginView.routeName: (context) => const LoginView(),
        RegisterView.routeName: (context) => const RegisterView(),
        HomeLayout.routeName: (context) => const HomeLayout(),
        EditTask.routeName: (context) => const EditTask(),
      },
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}
