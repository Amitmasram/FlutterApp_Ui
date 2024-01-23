import 'package:flutter/material.dart';
import 'routes/router.dart';
import 'ui/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Threads',
      theme: AppsTheme.theme,
      routerConfig: router,
    );
  }
}
