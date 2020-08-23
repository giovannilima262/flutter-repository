import 'package:flutter/material.dart';

class NewOutlineButton extends StatelessWidget {
  const NewOutlineButton({
    @required this.text,
    this.onPressed,
  });
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            child: Text(text),
            onPressed: onPressed,
            textColor: Colors.green,
            highlightedBorderColor: Colors.green,
            borderSide: BorderSide(
              width: 1,
              color: Colors.green
            ),
          ),
        )
      ],
    );
  }
}
