import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/BMColors.dart';
import '../utils/BMWidgets.dart';
import 'BMLoginNowScreen.dart';

class BMChangePasswordScreen extends StatelessWidget {
  FocusNode newPassword = FocusNode();
  FocusNode confirmPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      body: Column(
        children: [
          upperContainer(
            screenContext: context,
            child: headerText(title: 'Change Password'),
          ),
          lowerContainer(
              screenContext: context,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Text('Reset code was sent to your email. Please enter the code and create a new password.',
                        style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark, size: 14)),
                    30.height,
                    Text('Reset Code', style: primaryTextStyle(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmSpecialColor, size: 14)),
                    AppTextField(
                      nextFocus: newPassword,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textFieldType: TextFieldType.PHONE,
                      autoFocus: true,
                      cursorColor: bmPrimaryColor,
                      textStyle: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(borderSide: BorderSide(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmPrimaryColor)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmPrimaryColor)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmPrimaryColor)),
                      ),
                    ),
                    16.height,
                    Text('New Password', style: primaryTextStyle(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmSpecialColor, size: 14)),
                    AppTextField(
                      focus: newPassword,
                      nextFocus: confirmPassword,
                      textInputAction: TextInputAction.next,
                      textFieldType: TextFieldType.PASSWORD,
                      cursorColor: bmPrimaryColor,
                      suffixIconColor: appStore.isDarkModeOn ? Colors.white : bmPrimaryColor,
                      textStyle: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(borderSide: BorderSide(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmPrimaryColor)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmPrimaryColor)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmPrimaryColor)),
                      ),
                    ),
                    16.height,
                    Text('Confirm Password', style: primaryTextStyle(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmSpecialColor, size: 14)),
                    AppTextField(
                      focus: confirmPassword,
                      textInputAction: TextInputAction.done,
                      textFieldType: TextFieldType.PASSWORD,
                      cursorColor: bmPrimaryColor,
                      textStyle: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark),
                      suffix: Icon(Icons.check, color: Colors.teal),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                      ),
                    ),
                    100.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(color: appStore.isDarkModeOn ? bmTextColorDarkMode.withAlpha(50) : bmPrimaryColor.withAlpha(70), borderRadius: radius(100)),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back, color: appStore.isDarkModeOn ? Colors.white : bmPrimaryColor),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.teal, borderRadius: radius(100)),
                          child: IconButton(
                            icon: Icon(Icons.check, color: Colors.white),
                            onPressed: () {
                              BMLoginNowScreen().launch(context);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ).paddingSymmetric(horizontal: 16),
              )).expand()
        ],
      ),
    );
  }
}
