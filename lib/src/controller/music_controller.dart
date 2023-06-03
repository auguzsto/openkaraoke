import 'dart:io';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:openkaraoke/src/config/config.dart';
import 'package:openkaraoke/src/model/music_model.dart';

abstract class IMusic {
  Player getById(MusicModel music, String path);
}

class MusicController extends ChangeNotifier implements IMusic {
  ValueNotifier<bool> isCompleted = ValueNotifier<bool>(false);
  final config = Config();
  final player = Player(id: 69420);

  @override
  Player getById(MusicModel music, String path) {
    final file = Media.file(File("$path${music.id}.mp4"));
    player.open(file);

    player.playbackStream.listen((event) {
      if (event.isCompleted) {
        isCompleted.value = true;
      }
    });

    return player;
  }
}
