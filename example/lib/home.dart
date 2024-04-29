import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_call/video_call.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  @override
  Widget build(BuildContext context) {
    //const url = 'ws://192.168.2.5:4443';
    const url = 'wss://v3demo.mediasoup.org:4443';
    return Scaffold(
      body: VideoCallRoom(
        displayName: "Salim",
        roomId: "test-room",
        userId: getRandString(10),
        serverUrl: url,
      ),
    );
  }
}
