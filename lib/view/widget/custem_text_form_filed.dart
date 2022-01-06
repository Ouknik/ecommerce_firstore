// ignore_for_file: avoid_types_as_parameter_names

import 'package:firebasegetex/view/widget/custemtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;

  final String hint;

  dynamic Function(String?)? onSave;
  dynamic Function(String?)? validator;

  CustomTextFormField({
    required this.text,
    required this.hint,
    this.onSave,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CstumText(
            text: text,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onSave,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              fillColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
