import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:openkaraoke/src/app_widget.dart';
import 'package:openkaraoke/src/constants/labels.dart';
import 'package:openkaraoke/src/view/home/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  config.set(Labels.pathDefault);
  DartVLC.initialize();
  runApp(const AppWidget());
}
