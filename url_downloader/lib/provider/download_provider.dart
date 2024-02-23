import 'dart:developer' show log;
import 'dart:io';

import 'package:direct_link/direct_link.dart' show DirectLink;
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart'
    show FileDownloader, NotificationType;
import 'package:oktoast/oktoast.dart' show ToastPosition, showToast;

class DownloadProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final _directLink = DirectLink();
  var _siteModel;
  get siteModel => _siteModel;
  bool _isAppStart = true;
  bool get isAppStart => _isAppStart;
  void changeAppStart() {
    _isAppStart = false;
    notifyListeners();
  }

  bool _mediaUnavailable = false;
  bool get mediaUnavailable => _mediaUnavailable;

  void toggleLoading(loading) {
    _isLoading = loading;

    notifyListeners();
  }

  ///
  ///
  ///   get links data
  ///
//

  Future<void> getLinksData(String url, BuildContext context) async {
    try {
      changeAppStart();

      _isLoading = true;
      _mediaUnavailable = false;
      notifyListeners();

      _siteModel = await _directLink.check(url);
      if (siteModel?.title.toString() == 'null') {
        showToast('Please wait while we fetch Data',
            position: ToastPosition.bottom,
            textPadding: const EdgeInsets.all(15),
            textStyle: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ));

        for (int i = 1; i < 4; i++) {
          if (siteModel?.title.toString() == 'null') {
            log('🙌🙌 title is null so checking $i');

            _siteModel = await _directLink.check(url); // again checking
          } else {
            log('i contain value so returning from loop🌹🌹🌹');
            break;
          }
        }
        if (_siteModel.title == null) {
          _mediaUnavailable = true;
          notifyListeners();
        } else {
          _mediaUnavailable = false;
          notifyListeners();
        }
      }
    } catch (e) {
      log('an error occurred in getLinksData ❤❤❤❤ $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  ///
  /// downloads in audio and video
  ///
//

  Future<void> downloadMedia(
      String title, BuildContext context, mounted) async {
    try {
      final url = _siteModel.links[0].link;
      File? downloadedFile = await FileDownloader.downloadFile(
        url: url,
        name: title,
        notificationType: NotificationType.values.first,
        onDownloadCompleted: (path) {
          if (mounted) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('File Downloaded to Downloads folder')));
          }
        },
        onDownloadError: (errorMessage) {
          if (mounted) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(errorMessage)));
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Download Failed')));
          }
        },
      );
      log('😍😍😍😍 file path is  : : : ${downloadedFile?.path}');
    } catch (e) {
      log('😍😍😍😍 An error occured in downloadMedia : : : $e');
    }
  }
}
