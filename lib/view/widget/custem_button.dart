import 'package:firebasegetex/view/widget/custemtext.dart';
import 'package:flutter/material.dart';

import '../../constance.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

  Function()? onPress;

  CustomButton({
    @required this.onPress,
    this.text = 'Write text ',
    this.color = primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(18),
      onPressed: onPress,
      color: primaryColor,
      child: CstumText(
        alignment: Alignment.center,
        text: text,
        color: Colors.white,
      ),
    );
  }
}
