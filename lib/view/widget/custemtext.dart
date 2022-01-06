import 'package:flutter/material.dart';

class CstumText extends StatelessWidget {
  late final String text;
  late final double fontSize;
  late final Color color;
  late final int maxLine;
  late final double height;

  late final Alignment alignment;
  CstumText(
      {this.text = '',
      this.color = Colors.black,
      this.fontSize = 16,
      this.alignment = Alignment.topLeft,
      this.height = 1,
      this.maxLine = 1});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          height: height,
        ),
        maxLines: maxLine,
      ),
    );
  }
}
