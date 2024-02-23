import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saqib_downloader/screens/play_song_screen.dart';
import 'package:saqib_downloader/utils/colors.dart';

class AllMediaPage extends StatefulWidget {
  const AllMediaPage({super.key});

  @override
  State<AllMediaPage> createState() => _AllMediaPageState();
}

class _AllMediaPageState extends State<AllMediaPage> {
  bool isAllowed = false;
  void getPermissions() async {
    isAllowed = await Permission.storage.request().isGranted;
    setState(() {});
  }

  final player = AudioPlayer(); // Create a player

  @override
  void initState() {
    getPermissions();
    super.initState();
  }

  var audios;
  final OnAudioQuery _audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: isAllowed
          ? FutureBuilder(
              future: _audioQuery.querySongs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                        'An Error Occurred in fetching Audios from storage'),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3.0,
                        child: ListTile(
                          onTap: () async {
                            log('song path : : : 🤞🤞🤞${snapshot.data![index].uri}');
                            try {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PlaySongScreen(
                                    songDetail: snapshot.data![index]),
                              ));
                            } catch (e) {
                              log('An error occurred in navigating to next page : : : 🤞🤞🤞$e');
                            }
                          },
                          leading: Icon(
                            Icons.audiotrack,
                            color: ColorsTheme.orangeColor,
                          ),
                          title: Text(
                            snapshot.data![index].title.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            formatDuration(
                                snapshot.data![index].duration as int),
                            style: TextStyle(color: ColorsTheme.tealColor),
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Text('');
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

String formatDuration(int milliseconds) {
  Duration duration = Duration(milliseconds: milliseconds);
  String minutes = (duration.inMinutes).toString().padLeft(2, '0');
  String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}
