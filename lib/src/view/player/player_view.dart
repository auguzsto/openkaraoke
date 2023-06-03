import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:openkaraoke/src/controller/music_controller.dart';
import 'package:openkaraoke/src/model/music_model.dart';
import 'package:openkaraoke/src/view/home/home_view.dart';
import 'package:openkaraoke/src/view/points/points_view.dart';

class PlayerView extends StatefulWidget {
  final String? musicId;
  const PlayerView({
    super.key,
    this.musicId,
  });

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  @override
  Widget build(BuildContext context) {
    final musicModel = MusicModel(id: widget.musicId);
    final musicController = MusicController();

    return Scaffold(
      body: KeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        //Detecting keyboard ESC to back home view.
        onKeyEvent: (value) {
          if (value.logicalKey.keyLabel != "Escape") {
            return;
          }
          Player(id: 69420).dispose();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
              (route) => false);
        },

        //Video player config
        child: AnimatedBuilder(
          animation: musicController.isCompleted,
          builder: (context, child) {
            if (musicController.isCompleted.value) {
              musicController.dispose();
              return const PointsView();
            }

            return Video(
              player: musicController.getById(musicModel),
              showControls: false,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              scale: 1.0,
            );
          },
        ),
      ),
    );
  }
}
