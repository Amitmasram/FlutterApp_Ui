import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
        elevation: 0, content: Lottie.asset('assets/loading.json'));
  }
}

void showLoadingDialog() {
  Get.dialog(
    const LoadingDialog(),
    barrierDismissible: false,
  );
}

void hideLoadingDialog() {
  Get.back();
  return;
}
