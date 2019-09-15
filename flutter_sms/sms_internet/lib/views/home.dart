import 'package:flutter/material.dart';
import 'package:sms_internet/models/command.dart';
import 'package:sms_internet/services/commandsService.dart';
import "package:sms_internet/services/smsService.dart";


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  Widget commandButton(context, Command command) {
    return RaisedButton(
      child: Text(command.name),
      onPressed: (){
        Navigator.of(context).pushNamed('/' + command.name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget >[
              Text('SMS INTERNET'),
              commandButton(context, commands[0]),
              commandButton(context, commands[1]),
              commandButton(context, commands[2]),
              commandButton(context, commands[3]),
              commandButton(context, commands[4]),
              commandButton(context, commands[5]),
              commandButton(context, commands[6]),

            ],
          ),
        ),
      )

    );
  }
}
