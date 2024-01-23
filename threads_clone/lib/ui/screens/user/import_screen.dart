import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class ImportScreen extends StatelessWidget {
  const ImportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Profile',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),
              Text(
                'Customise your Threads profile',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: AppsTheme.color.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
