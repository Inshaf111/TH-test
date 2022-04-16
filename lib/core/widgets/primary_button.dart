import 'package:dukkantek/core/contants/theme_contants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color backgroundColor;
  const PrimaryButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              )),
              backgroundColor:
                  MaterialStateProperty.all<Color>(backgroundColor)),
          onPressed: () {
            onPressed();
          },
          child: Text(
            text,
            style:
                const TextStyle(fontSize: kfontLarge, color: kfontColorLight),
          )),
    );
  }
}
