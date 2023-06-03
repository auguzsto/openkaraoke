import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:openkaraoke/src/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DartVLC.initialize();
  runApp(const AppWidget());
}
