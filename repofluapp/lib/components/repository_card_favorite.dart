import 'package:flutter/material.dart';
import 'package:repofluapp/components/title_repository.dart';
import 'package:repofluapp/models/repository.dart';

class RepositoryCardFavorite extends StatelessWidget {
  const RepositoryCardFavorite({
    @required this.value,
    this.onRemove,
  });
  final RepositoryModel value;
  final Function onRemove;
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
              color: Colors.green,
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: TitleRepository(
                    title: value.name,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: onRemove,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
