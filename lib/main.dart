import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:openkaraoke/src/app_widget.dart';
import 'package:openkaraoke/src/constants/labels.dart';
import 'package:openkaraoke/src/view/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await config.getByCollection('config').then((value) =>
      value?.isEmpty ?? value == null ? config.set(Labels.pathDefault) : null);
  DartVLC.initialize();
  runApp(const AppWidget());
}
