import 'package:flutter/material.dart';
import 'package:repofluapp/language/demo_localizations.dart';

class MessageError extends StatelessWidget {
  const MessageError({
    this.onPressed,
  });
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 3,
              color: Colors.red,
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    DemoLocalizations.of(context).fetchFailed,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.replay),
                  onPressed: onPressed,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
