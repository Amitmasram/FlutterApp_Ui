import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import '../provider/play_song_provider.dart';

class PlaySongScreen extends StatefulWidget {
  const PlaySongScreen({super.key, required this.songDetail});
  final SongModel songDetail;
  @override
  State<PlaySongScreen> createState() => _PlaySongScreenState();
}

class _PlaySongScreenState extends State<PlaySongScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaySongProvider>(
        builder: (context, playSongProvider, child) {
      // playSongProvider.val.toInt()
      return PopScope(
        onPopInvoked: (didPop) {
          playSongProvider.stopSong();
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 40),

                // image
                Align(
                  child: Image.asset('assets/music_player_image.jpg'),
                ),
                const SizedBox(height: 20),

                ///
                ///title
                //
                Text(
                  widget.songDetail.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                ///
                /// slider
                //
                Row(
                  children: [
                    Text(playSongProvider
                        .formatDuration(playSongProvider.val.toInt())),
                    Expanded(
                      child: Slider(
                        min: 0,
                        max: widget.songDetail.duration!.toDouble(),
                        value: playSongProvider.val
                            .clamp(0, widget.songDetail.duration!.toDouble()),
                        onChanged: (value) {
                          playSongProvider.seekToPosition(value);

                          playSongProvider.getVal(value);
                        },
                      ),
                    ),
                    Text(playSongProvider
                        .formatDuration(widget.songDetail.duration as int)),
                  ],
                ),

                ///
                /// play button
                //
                IconButton(
                    onPressed: () {
                      playSongProvider.playSong(widget.songDetail);
                    },
                    icon: Icon(
                      playSongProvider.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 35,
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
