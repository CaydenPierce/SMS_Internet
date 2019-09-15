import 'package:flutter/material.dart';

import '../style.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final Function onTap;

  MyCard({this.child, this.onTap});

  @override build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      color: MyColors.DarkGray,
      elevation: 4,
      child: child,
    ); 
  }
}