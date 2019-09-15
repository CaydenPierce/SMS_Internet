import 'package:flutter/material.dart';

import '../style.dart';

class MyTextBox extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;
  final String label;
  final TextInputType keyboardType;
  // final int maxLength;

  MyTextBox(this.textEditingController, {this.hint, this.label, this.keyboardType});//, this.maxLength = 999});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: TextFormField(

        // maxLength: maxLength,
        controller: textEditingController,
        style: TitleTextBoldWhite,
        decoration: InputDecoration(
          labelText: label ?? "", 
          labelStyle: BodyTextGray,
          hintText: hint ?? "",
          hintStyle: BodyTextBoldGray,
          alignLabelWithHint: false,
          
        ),
        keyboardType: keyboardType ?? TextInputType.text,
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter some text';
          }
          return null;
        },
      ),
    );
  }
}