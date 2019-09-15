import 'package:flutter/material.dart';
import 'package:sms_internet/models/command.dart';
import 'package:sms_internet/services/commandsService.dart';
import "package:sms_internet/services/smsService.dart";
import 'package:sms_internet/views/components/mycard.dart';

import '../style.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  Widget commandButton(context, Command command) => Padding(
    padding: const EdgeInsets.only(left:10.0, right:10.0, top: 3, bottom: 3 ),
    child: MyCard(
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        title: Text(
          command.name,
          style: BigTextBoldWhite 
        ),

        // subtitle: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     Text("Last Workout- Arm day", style: BodyTextBoldBlue),
        //     Text("June 10th, 2019", style: BodyTextGray),
        //   ],
        // ),

        onTap: () {
          Navigator.of(context).pushNamed('/' + command.name);
        },

      ),
    ),
  );


  Widget commandButton2(context, Command command) {
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
      backgroundColor: MyColors.DarkGray3,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          color: MyColors.DarkGray2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,

            children: <Widget >[
              Padding(
                padding: EdgeInsets.all(10),
                child: Center(child:Text('Commands', style: BigTextWhite)),
              ),
              commandButton(context, commands[0]),
              commandButton(context, commands[1]),
              commandButton(context, commands[2]),
              commandButton(context, commands[3]),
              commandButton(context, commands[4]),
              commandButton(context, commands[5]),
              commandButton(context, commands[6]),
              commandButton(context, commands[7]),
              commandButton(context, commands[8]),

            ],
          ),
        ),
      )

    );
  }
}
