import 'package:flutter/material.dart';
import 'package:repofluapp/components/new_outline_button.dart';
import 'package:repofluapp/components/title_repository.dart';
import 'package:repofluapp/language/demo_localizations.dart';
import 'package:repofluapp/models/repository.dart';
import 'package:repofluapp/utils/format_date.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({
    @required this.value,
    this.onSave,
  });
  final RepositoryModel value;
  final Function onSave;
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
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: TitleRepository(
                    title: value.name,
                  ),
                ),
                Text(
                  FormatDate.jsonToFormatString(value.createdAt ?? ''),
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: value.description != null ? 10 : 0),
            Text(
              value.description ?? '',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                value.language != null
                    ? Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.code,
                              size: 20,
                              color: Colors.deepPurple,
                            ),
                            Text(value.language ?? ''),
                          ],
                        ),
                      )
                    : Container(),
                value.stargazersCount != null
                    ? Row(
                        children: <Widget>[
                          Icon(
                            Icons.star_border,
                            size: 20,
                            color: Colors.yellow[800],
                          ),
                          Text('${value.stargazersCount}' ?? ''),
                        ],
                      )
                    : Container(),
              ],
            ),
            NewOutlineButton(
              text: DemoLocalizations.of(context).saveRepo,
              onPressed: onSave,
            ),
          ],
        ),
      ),
    );
  }
}
