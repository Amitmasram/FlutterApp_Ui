import 'package:flutter/material.dart';
import 'package:medical_app/style/app_style.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 150),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset(AppStyle.notifications),
          ),
          Text(
            'No Notification Yet !',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          )
        ],
      ),
    );
  }
}
