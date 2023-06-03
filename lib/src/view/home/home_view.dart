import 'dart:io';
import 'package:flutter/material.dart';
import 'package:openkaraoke/src/config/config.dart';
import 'package:openkaraoke/src/constants/labels.dart';
import 'package:openkaraoke/src/view/config/config_view.dart';
import 'package:openkaraoke/src/view/player/player_view.dart';
import 'package:openkaraoke/src/constants/error.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final controller = TextEditingController();
final config = Config();
final keyInputCod = GlobalKey();

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    config.db.collection('config').stream.listen((event) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Config
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfigView(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
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

      //Get config
      bottomNavigationBar: FutureBuilder(
        future: config.getByCollection('config'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final path = snapshot.data!['path'];

          //Input
          return Column(
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
                onFieldSubmitted: (value) async {
                  final file = File("$path${controller.text}.mp4");
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
                              path: path,
                            ),
                          ),
                        );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
