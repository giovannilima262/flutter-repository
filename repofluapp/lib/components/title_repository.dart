import 'package:flutter/material.dart';
import 'package:repofluapp/utils/color_team.dart';

class TitleRepository extends StatelessWidget {
  const TitleRepository({
    this.title,
  });
  final title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.link,
          color: Colors.blueGrey,
        ),
        SizedBox(width: 5),
        Text(
          title ?? '',
          style: TextStyle(
            color: ColorTeam.blueDark,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
