import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

class SnackBarService {

  static void showSuccessMessage(String msg) {

    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 150 : 95,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: msg.length > 80
                ? Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    msg,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'SF pro',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: cancelFunc,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
                : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    msg,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.fade,
                    maxLines: 3,
                    style: const TextStyle(
                      fontFamily: 'SF pro',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: cancelFunc,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      duration: const Duration(
        seconds: 2,
      ),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static void showAlertMessage(String msg) {

    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 150 : 95,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(12),
            ),
            child: msg.length > 80
                ? Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    msg,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'SF pro',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: cancelFunc,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
                : Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    msg,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.fade,
                    maxLines: 3,
                    style: const TextStyle(
                      fontFamily: 'SF pro',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: cancelFunc,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      duration: const Duration(
        seconds: 2,
      ),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static void showErrorMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 150 : 95,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.red[600],
              borderRadius: BorderRadius.circular(12),
            ),
            child: msg.length > 80
                ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    msg,
                    textAlign: TextAlign.center,
                    // maxLines: 3,
                    // overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontFamily: 'SF pro',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: cancelFunc,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    msg,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    style: const TextStyle(
                      fontFamily: 'SF pro',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: cancelFunc,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      duration: const Duration(
        seconds: 2,
      ),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

}
