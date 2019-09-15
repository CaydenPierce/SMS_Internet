import 'package:flutter/material.dart';
import 'views/page/commandPage.dart';
import "views/page/home.dart";
import "services/smsService.dart";
import 'package:sms_internet/services/commandsService.dart';
import "views/page/webview.dart";
import "views/page/TabedPage.dart";


void main() async {
  runApp(MyApp());
  initSmsListener();
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        // '/' + commands[8].name : (BuildContext context) => new CommandPage(commands[8]),
      },
    );
  }
}

