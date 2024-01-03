import 'dart:async';

import 'package:epay_flutter/utils/GPColors.dart';
import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

class GPPinVerifyScreen extends StatefulWidget {
  static String tag = '/GPPinVerifyScreen';

  @override
  GPPinVerifyScreenState createState() => GPPinVerifyScreenState();
}

class GPPinVerifyScreenState extends State<GPPinVerifyScreen> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GPColorBlack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: GPColorBlack,
        leading: IconButton(
          color: backgroundColor,
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: backgroundColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _showLockScreen(
            context,
            opaque: false,
            circleUIConfig: CircleUIConfig(
                borderColor: Colors.white,
                fillColor: Colors.white,
                circleSize: 20),
            keyboardUIConfig: KeyboardUIConfig(
                digitBorderWidth: 2, primaryColor: Colors.white),
            cancelButton: Icon(Icons.arrow_back, color: Colors.blue),
            digits: ['1', '2', '3', '4', '4', '5', '6', '7', '8', '9', '0'],
          )
        ],
      ),
    );
  }

  _showLockScreen(BuildContext context,
      {required bool opaque,
      CircleUIConfig? circleUIConfig,
      KeyboardUIConfig? keyboardUIConfig,
      Widget? cancelButton,
      List<String>? digits}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: opaque,
        pageBuilder: (context, animation, secondaryAnimation) => PasscodeScreen(
          title: Text(
            'Enter App Passcode',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          circleUIConfig: circleUIConfig,
          keyboardUIConfig: keyboardUIConfig,
          passwordEnteredCallback: _onPasscodeEntered,
          cancelButton: cancelButton!,
          deleteButton: Text('Delete',
              style: TextStyle(fontSize: 16, color: Colors.white),
              semanticsLabel: 'Delete'),
          shouldTriggerVerification: _verificationNotifier.stream,
          backgroundColor: Colors.black.withOpacity(0.8),
          cancelCallback: _onPasscodeCancelled,
          digits: digits,
          passwordDigits: 6,
          bottomWidget: _buildPasscodeRestoreButton(),
        ),
      ),
    );
  }

  _onPasscodeEntered(String enteredPasscode) {
    const storedPasscode = '123456';
    bool isValid = storedPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
      });
    }
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  _buildPasscodeRestoreButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
        child: TextButton(
          child: Text(
            "Reset passcode",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w300),
          ),
          //   splashColor: Colors.white.withOpacity(0.4),
          //   highlightColor: Colors.white.withOpacity(0.2),
          onPressed: _resetAppPassword,
        ),
      ),
    );
  }

  _resetAppPassword() {
    Navigator.maybePop(context).then((result) {
      if (!result) {
        return;
      }
      _showRestoreDialog(() {
        Navigator.maybePop(context);
      });
    });
  }

  _showRestoreDialog(VoidCallback onAccepted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Reset passcode",
              style: const TextStyle(color: Colors.black87)),
          content: Text(
              "Passcode reset is a non-secure operation!\n\nConsider removing all user data if this action performed.",
              style: const TextStyle(color: Colors.black87)),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text("Cancel", style: const TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            TextButton(
              child: Text("I understand", style: const TextStyle(fontSize: 18)),
              onPressed: onAccepted,
            ),
          ],
        );
      },
    );
  }
}
