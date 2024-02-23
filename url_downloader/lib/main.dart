import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:saqib_downloader/provider/bottom_navbar_provider.dart';
import 'package:saqib_downloader/provider/download_provider.dart';
import 'package:saqib_downloader/provider/play_song_provider.dart';
import 'package:saqib_downloader/screens/ToggleScreens.dart';
import 'package:saqib_downloader/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DownloadProvider()),
        ChangeNotifierProvider(create: (context) => PlaySongProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
      ],
      child: OKToast(
        child: MaterialApp(
          title: 'SR Downloader',
          theme: ThemeData(
            primaryColor: Colors.teal,
            appBarTheme: AppBarTheme(
              backgroundColor: ColorsTheme.tealColor,
            ),
            useMaterial3: true,
          ),
          home: const ToggleScreens(),
        ),
      ),
    );
  }
}
