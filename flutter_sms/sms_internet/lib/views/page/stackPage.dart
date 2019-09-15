import 'package:flutter/material.dart';
import 'package:sms_internet/services/state.dart';
import 'package:sms_internet/views/components/mycard.dart';
import 'package:sms_internet/views/style.dart';


class StackPage extends StatefulWidget {
  @override
  _StackPageState createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {

  List<TextEditingController> textControllers = [];
  List<Widget> textFields = [];

  @override
  void initState() {
    appState.listenToStack(()=>{
      this.setState((){})
    });
  }

  Widget _getResponse(String string) {
    return MyCard(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(string, style: BodyTextWhite,)
      )
    );
  }
  

  List<Widget> _getStack() {
    List<Widget> widgets = [];
    for (String response in appState.stack) {
      widgets.add(_getResponse(response));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.DarkGray3,
      appBar: AppBar(
        title: Text("Recent Searches"),
      ),

      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: ListView(
          children: _getStack()
        )
      )
    );
  }
}
