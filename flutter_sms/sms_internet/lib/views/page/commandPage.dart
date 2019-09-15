import 'package:flutter/material.dart';
import 'package:sms_internet/models/command.dart';
import "package:sms_internet/services/smsService.dart";
import 'package:sms_internet/services/state.dart';
import 'package:sms_internet/views/components/mybutton.dart';
import 'package:sms_internet/views/components/mycard.dart';
import 'package:sms_internet/views/components/mytextbox.dart';
import 'package:sms_internet/views/style.dart';


class CommandPage extends StatefulWidget {
  final Command command;
//  CommandPage({Key key, this.command}) : super(key: key);
  CommandPage(this.command);

  @override
  _CommandPageState createState() => _CommandPageState();
}

class _CommandPageState extends State<CommandPage> {

  List<TextEditingController> textControllers = [];
  List<Widget> textFields = [];

  Widget _argumentTextField(String argument) {
    TextEditingController textEditingController = new TextEditingController();
    textControllers.add(textEditingController);

    if (argument == "'mode'")
      return MyTextBox(textEditingController, label:argument, hint:"Walking, Driving");

    return MyTextBox(textEditingController, label:argument);
    
    // return TextField(
    //   decoration: InputDecoration( border: InputBorder.none, hintText: argument),
    //   controller: textEditingController,
    // );


  }


  @override
  void initState() {
    appState.clearResponse();
    for (String argument in widget.command.arguments) {
      textFields.add(Padding(
        child: _argumentTextField(argument),
        padding: EdgeInsets.all(5.0),
      ));
    }

    setSmsCallback((String message)=>{
      this.setState((){})
    });

  }

  List<String> _getArguments() {
    List<String> arguments = [];
    if (widget.command.name == "Bash")
      return [textControllers[0].text];

    for (TextEditingController textController in textControllers) {
      arguments.add('"' + textController.text + '"');
    }
    return arguments;
  }

  Widget _getTextFields() {
    return Column(
      children: textFields,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget _getButton() {
    return MyButton(
      text: "Run",
      textStyle: BodyTextWhite,
      onPressed: (){
        sendSMS(widget.command.command + " " + _getArguments().join(" "));
      },
    );
  }

  Widget _getResponse() {
    if (appState.smsResponse != "") {
      return MyCard(
        
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(appState.smsResponse, style: BodyTextWhite,)
        )
      );
    }

    return Text(appState.smsResponse);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.DarkGray3,
      appBar: AppBar(
        title: Text(widget.command.name),
        
      ),

      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget >[
            MyCard(
              child: Column(
                children: <Widget>[
                  _getTextFields(),
                  _getButton(),
                ],
              ),
            ),
            
            
            Expanded(
              child: ListView(
                children: [_getResponse()]
              )
            )

          ],
        ),
      ),

    );
  }
}
