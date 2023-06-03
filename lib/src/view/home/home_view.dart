import 'dart:io';
import 'package:flutter/material.dart';
import 'package:openkaraoke/src/config/config.dart';
import 'package:openkaraoke/src/constants/labels.dart';
import 'package:openkaraoke/src/view/player/player_view.dart';
import 'package:openkaraoke/src/constants/error.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final controller = TextEditingController();
final keyInputCod = GlobalKey();

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Body
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 190,
                child: Icon(Icons.mic_external_on, size: 180),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),

      //Input
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            key: keyInputCod,
            controller: controller,
            autofocus: true,
            style: const TextStyle(fontSize: 32),
            decoration: InputDecoration(
              hintText: Labels.enterCode,
            ),

            //Check if path exists.
            onFieldSubmitted: (value) {
              final file = File("${Config.pathMusics}${controller.text}.mp4");
              !file.existsSync()
                  ? ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(Error.errorInvalidMusicCode),
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerView(
                          musicId: controller.text,
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
