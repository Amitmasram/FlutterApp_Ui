import 'package:flutter/material.dart';
import 'package:threads_clone/ui/utils/utilities.dart';

import '../../../gen/assets.gen.dart';
import '../../../routes/router.dart';
import '../../utils/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Assets.images.pattern.image(),
                  ),
                ),
              ),
              50.height,
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => context.goNamed(Routes.home),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffDDDDDD),
                              blurRadius: 6.0,
                              spreadRadius: 2.0,
                              offset: Offset(0.0, 0.0),
                            )
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 32,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Log in with Instagram',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: AppsTheme.color.neutral.shade600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'agis',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    5.width,
                                    Assets.icons.verified.image(height: 14)
                                  ],
                                )
                              ],
                            ),
                            Assets.images.instagram
                                .image(height: 39, width: 39),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'Switch account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF999999),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
