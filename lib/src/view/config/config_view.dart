import 'package:flutter/material.dart';
import 'package:openkaraoke/src/constants/labels.dart';
import 'package:openkaraoke/src/constants/messages.dart';
import 'package:openkaraoke/src/view/home/home_view.dart';

class ConfigView extends StatelessWidget {
  ConfigView({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: AppBar(),

      //Config
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: CircleAvatar(
              radius: 170,
              child: Icon(
                Icons.settings,
                size: 170,
              ),
            ),
          ),
          const SizedBox(height: 25),

          //Get config
          FutureBuilder(
            future: config.getByCollection('config'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              //Input
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextFormField(
                      controller: controller,
                      style: const TextStyle(fontSize: 35),
                      decoration: InputDecoration(
                        hintText: snapshot.data!["path"],
                      ),
                    ),
                  ),

                  //Button & save message
                  SizedBox(
                    height: 87,
                    child: ElevatedButton(
                      onPressed: () async {
                        config.set(controller.text).then(
                              (value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(Messages.saveConfig),
                                ),
                              ),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0))),
                      child: Text(
                        Labels.textButtonSaveConfig,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
