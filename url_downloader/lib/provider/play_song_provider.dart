import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaySongProvider with ChangeNotifier {
  final audioPlayer = AudioPlayer();
  double _val = 0.0;
  double get val => _val;
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  void getVal(double value) {
    _val = value;
    notifyListeners();
  }

  void checkIfPlaying(bool playingOrNot) {
    _isPlaying = playingOrNot;
    notifyListeners();
  }

  final List<StreamSubscription> _subscriptions = [];

  void _subscribe(Stream stream, void Function(dynamic) onData) {
    _subscriptions.add(stream.listen(onData));
  }

  void disposeSubscriptions() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();
  }

  void seekToPosition(double position) {
    audioPlayer.seek(Duration(milliseconds: position.toInt()));
  }

  void playSong(SongModel songDetail) {
    _subscribe(
      audioPlayer.durationStream,
      (duration) {
        print(duration);
      },
    );
    _subscribe(
      audioPlayer.positionStream,
      (position) {
        _val = position.inMilliseconds.toDouble();
        notifyListeners();
      },
    );
    _subscribe(
      audioPlayer.playerStateStream,
      (playerState) {
        if (playerState.processingState == ProcessingState.completed) {
          _isPlaying = false;
          _val = 0.0;
          notifyListeners();
        }
      },
    );

    if (_isPlaying) {
      checkIfPlaying(false);
      audioPlayer.stop();
    } else {
      checkIfPlaying(true);
      audioPlayer.setAudioSource(AudioSource.file(songDetail.data.toString()));
      audioPlayer.play();
    }
  }

  void stopSong() {
    audioPlayer.stop();
    disposeSubscriptions();
    _isPlaying = false;
    notifyListeners();
  }

  String formatDuration(int milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds);
    String minutes = (duration.inMinutes).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String formatDurationInSeconds(int seconds) {
    String minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    String remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }
}
