import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart' show ToastPosition, showToast;
import 'package:provider/provider.dart' show Provider;
import 'package:saqib_downloader/utils/colors.dart';
import 'package:shimmer/shimmer.dart' show Shimmer;

import '../provider/download_provider.dart';
import '../widgets/elevated_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final textFieldFocuseNode = FocusNode();
  @override
  void dispose() {
    searchController.dispose();
    textFieldFocuseNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final downloadProvider = Provider.of<DownloadProvider>(context);
    final size = MediaQuery.of(context).size;
    log(downloadProvider.isAppStart.toString());
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.03,
          right: size.width * 0.03,
          top: size.width * 0.08),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: size.width * 0.037,
                    ),
                    focusNode: textFieldFocuseNode,
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Paste the URL here',
                      labelStyle: TextStyle(
                        fontSize: size.width * 0.037,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15),
                      focusedBorder: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.015),
                ElevatedButtonWidget(
                    text: 'Go',
                    callbackFunction: () async {
                      textFieldFocuseNode.unfocus();
                      if (searchController.text.isEmpty) {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please enter a URL')));
                        return;
                      }
                      downloadProvider.getLinksData(
                          searchController.text.toString(), context);
                    }),
              ],
            ),

            ///
            /// searched data
            //
            SizedBox(height: size.width * 0.1),
            Column(
              children: [
                if (downloadProvider.siteModel != null &&
                    downloadProvider.isLoading == false &&
                    downloadProvider.siteModel.title.toString() != 'null')
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      /// picture
                      ///
                      SizedBox(
                        height: size.height * 0.35,
                        width: size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:
                              downloadProvider.siteModel.thumbnail.toString() ==
                                      'null'
                                  ? const Text('')
                                  : Image.network(
                                      downloadProvider.siteModel.thumbnail,
                                      fit: BoxFit.fill,
                                    ),
                        ),
                      ),
                      SizedBox(height: size.width * 0.03),

                      ///
                      /// Title
                      ///
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          downloadProvider.siteModel.title ?? '',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: size.width * 0.04),

                      ///
                      /// Download Buttons
                      //
                      ElevatedButtonWidget(
                        callbackFunction: () {
                          try {
                            downloadProvider.downloadMedia(
                                '${downloadProvider.siteModel.title}.mp4',
                                context,
                                mounted);
                            showToast('File is Downloading',
                                position: ToastPosition.bottom,
                                textPadding: const EdgeInsets.all(15),
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ));
                          } catch (e) {
                            log('An eror occureed in download button 🤞🤞🤞 $e');
                          }
                        },
                        text: 'Download Video',
                      ),
                      SizedBox(height: size.width * 0.05),
                      ElevatedButtonWidget(
                        callbackFunction: () {
                          try {
                            downloadProvider.downloadMedia(
                                '${downloadProvider.siteModel.title}.mp3',
                                context,
                                mounted);
                            showToast('File is Downloading',
                                position: ToastPosition.bottom,
                                textPadding: const EdgeInsets.all(15),
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ));
                          } on PlatformException catch (e) {
                            log('✔✔✔✔✔✔✔ $e');
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Download File Error')));
                          } catch (e) {
                            log('An error occurred in download btun ✌✌✌ $e');
                          }
                        },
                        text: 'Download Audio ',
                      ),
                    ],
                  ),
                if (downloadProvider.isLoading == true)
                  Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white60,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///
                        /// picture
                        ///
                        Container(
                          height: size.height * 0.35,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: size.width * 0.03),

                        ///
                        /// Title
                        ///
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                            width: size.width * 0.3,
                            height: size.width * 0.05,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: size.width * 0.04),

                        ///
                        /// Download Buttons
                        //
                        ElevatedButtonWidget(
                          callbackFunction: () {},
                          text: 'Download Video (MP4)',
                        ),
                        SizedBox(height: size.width * 0.05),
                        ElevatedButtonWidget(
                          callbackFunction: () {},
                          text: 'Download Audio (MP3)',
                        ),
                      ],
                    ),
                  ),
              ],
            ),

            ///
            /// media unavailable
            //
            if (downloadProvider.mediaUnavailable)
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * 0.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'OOPS! ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.sentiment_neutral_sharp,
                          color: ColorsTheme.orangeColor,
                        )
                      ],
                    ),
                    const Text(
                        'Sorry! We coudn\'t find what your looking for '),
                  ],
                ),
              ),

            ///
            /// app starts
            //
            if (downloadProvider.isAppStart)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.1),
                  SizedBox(
                    width: size.width * 0.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'assets/all_downloader.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    'All in One Downloader',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.05,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
