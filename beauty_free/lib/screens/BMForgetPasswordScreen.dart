import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../utils/BMColors.dart';
import '../utils/BMWidgets.dart';
import 'BMChangePasswordScreen.dart';

class BMForgetPasswordScreen extends StatelessWidget {
  const BMForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      body: Column(
        children: [
          upperContainer(
            screenContext: context,
            child: headerText(title: 'Forget Password'),
          ),
          lowerContainer(
              screenContext: context,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Text('Please enter your email below to receive your password reset instructions.',
                        style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark, size: 14)),
                    30.height,
                    Text('Email', style: primaryTextStyle(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmSpecialColor, size: 14)),
                    AppTextField(
                      keyboardType: TextInputType.emailAddress,
                      textFieldType: TextFieldType.EMAIL,
                      autoFocus: true,
                      cursorColor: bmPrimaryColor,
                      textStyle: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark),
                      suffix: Icon(Icons.check, color: Colors.teal),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(borderSide: BorderSide(color: appStore.isDarkModeOn ? bmPrimaryColor : context.iconColor)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: appStore.isDarkModeOn ? bmPrimaryColor : context.iconColor)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: appStore.isDarkModeOn ? bmPrimaryColor : context.iconColor)),
                      ),
                    ),
                    300.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(color: appStore.isDarkModeOn ? bmTextColorDarkMode.withOpacity(0.5) : bmPrimaryColor.withAlpha(70), borderRadius: radius(100)),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back, color: appStore.isDarkModeOn ? Colors.white : bmPrimaryColor),
                            onPressed: () {
                              finish(context);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: bmPrimaryColor, borderRadius: radius(100)),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward, color: Colors.white),
                            onPressed: () {
                              BMChangePasswordScreen().launch(context);
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
