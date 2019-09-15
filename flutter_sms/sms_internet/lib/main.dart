import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_internet/views/commandPage.dart';
import "views/home.dart";
import "services/smsService.dart";
import 'package:sms_internet/services/commandsService.dart';
import "views/webview.dart";
import "views/TabedPage.dart";



void main() async {

//  const platform = const MethodChannel('flutter.native/helper');
//  String response = "";
//  try {
//    final String result = await platform.invokeMethod('helloFromNativeCode');
//    response = result;
//    print(result);
//  } on PlatformException catch (e) {
//    response = "Failed to Invoke: '${e.message}'.";
//  }

  runApp(MyApp());
  initSmsListener();
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'SMS Internet',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'SMS Internet'),

      routes: <String, WidgetBuilder> {
        '/' + commands[0].name : (BuildContext context) => TabedPage([new CommandPage(commands[0]), WebViewTest()], [Icon(Icons.settings), Icon(Icons.web)]),
        '/' + commands[1].name : (BuildContext context) => new CommandPage(commands[1]),
        '/' + commands[2].name : (BuildContext context) => new CommandPage(commands[2]),
        '/' + commands[3].name : (BuildContext context) => new CommandPage(commands[3]),
        '/' + commands[4].name : (BuildContext context) => new CommandPage(commands[4]),
        '/' + commands[5].name : (BuildContext context) => new CommandPage(commands[5]),
        '/' + commands[6].name : (BuildContext context) => new CommandPage(commands[6]),
        '/' + commands[7].name : (BuildContext context) => new CommandPage(commands[7]),
      },
    );
  }
}

