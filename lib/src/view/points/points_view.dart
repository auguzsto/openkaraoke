import 'dart:math';

import 'package:flutter/material.dart';
import 'package:openkaraoke/src/constants/labels.dart';
import 'package:openkaraoke/src/view/home/home_view.dart';

class PointsView extends StatefulWidget {
  const PointsView({super.key});

  @override
  State<PointsView> createState() => _PointsViewState();
}

class _PointsViewState extends State<PointsView> {
  @override
  Widget build(BuildContext context) {
    //Back home view after 10 seconds.
    Future.delayed(
      const Duration(seconds: 10),
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
          (route) => false),
    );

    return Scaffold(
      //Body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            //View points
            child: Container(
              width: 500,
              height: 500,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Labels.yourNote.toUpperCase(),
                    style: const TextStyle(fontSize: 45),
                  ),
                  const SizedBox(height: 25),
                  CircleAvatar(
                    radius: 98,
                    child: Text(
                      "${Random.secure().nextInt(100)}",
                      style: const TextStyle(fontSize: 45),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
