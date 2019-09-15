import 'package:flutter/material.dart';

import '../style.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final Color buttonColor;
  final TextStyle textStyle;
  final String text;
  final EdgeInsets edgeInsets;

  MyButton(
      {this.onPressed,
      this.buttonColor,
      this.textStyle,
      this.text,
      this.edgeInsets});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: buttonColor ?? MyColors.Blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding:
            edgeInsets ?? EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(text ?? "",
            style: textStyle ?? Theme.of(context).textTheme.button),
      ),
      onPressed: onPressed,
    );
  }
}
