import 'package:bankingapp/banking/screen/BankingSplash.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capital Bank',
      scrollBehavior: SBehavior(),
      home: BankingSplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
