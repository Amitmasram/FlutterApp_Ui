import 'package:flutter/material.dart';

import '../utils/theme.dart';

enum AppsButtontype { primary, secondary, link }

class AppsButton extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? textColor;
  final Color? color;
  final AppsButtontype? buttonType;
  final EdgeInsets? padding;
  final bool enabled;
  final void Function()? onTap;
  final void Function()? onTapDisabled;

  const AppsButton({
    Key? key,
    this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.textColor,
    this.color,
    this.buttonType = AppsButtontype.primary,
    this.padding,
    this.onTap,
    this.onTapDisabled,
    this.enabled = true,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = color ?? Colors.blue;
    // var suffix = suffixIcon;
    // if (suffixIcon != null) {
    //   suffix = Image(
    //     image: suffixIcon!.image,
    //     color: suffixIcon?.color != null
    //         ? suffixIcon?.color!
    //         : buttonType == KalogButtontype.primary
    //             ? KalogTheme.color.neutral.shade100
    //             : primaryColor,
    //   );
    // }

    // var prefix = prefixIcon;
    // if (prefixIcon != null) {
    //   suffix = Image(
    //     image: prefixIcon!.image,
    //     color: prefixIcon?.color != null
    //         ? prefixIcon?.color!
    //         : buttonType == KalogButtontype.primary
    //             ? KalogTheme.color.neutral.shade100
    //             : primaryColor,
    //   );
    // }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          if (enabled) {
            if (onTap != null) {
              onTap!();
            }
          } else {
            if (onTapDisabled != null) {
              onTapDisabled!();
            }
          }
        },
        child: Container(
          padding: padding == null && buttonType != AppsButtontype.link
              ? const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                )
              : padding,
          decoration: BoxDecoration(
            color: buttonType == AppsButtontype.primary
                ? !enabled
                    ? AppsTheme.color.neutral
                    : primaryColor
                : buttonType == AppsButtontype.secondary
                    ? AppsTheme.color.neutral.shade100
                    : null,
            border: buttonType == AppsButtontype.link
                ? null
                : Border.all(
                    color: !enabled ? AppsTheme.color.neutral : primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null) prefixIcon!,
              if (text != null)
                Text(
                  text!,
                  style: textStyle ??
                      TextStyle(
                        color: !enabled
                            ? AppsTheme.color.neutral.shade300
                            : textColor ??
                                (buttonType == AppsButtontype.primary
                                    ? AppsTheme.color.neutral.shade100
                                    : primaryColor),
                      ),
                ),
              if (suffixIcon != null) suffixIcon!,
            ],
          ),
        ),
      ),
    );
  }
}
