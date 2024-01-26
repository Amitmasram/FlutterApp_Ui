import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:jewelry_app/app/modules/views/home/home_view.dart';

import 'app/data/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(defaultOverlay);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 924),
        minTextAdapt: true,
        builder: (context, child) => GetMaterialApp(
              title: "Jewelry App",
              debugShowCheckedModeBanner: false,
              scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
              defaultTransition: Transition.fadeIn,
              home: HomeView(),
            ));
  }
}
