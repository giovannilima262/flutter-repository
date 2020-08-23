import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repofluapp/components/repository_card_favorite.dart';
import 'package:repofluapp/language/demo_localizations.dart';
import 'package:repofluapp/providers/repository_list.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  RepositoryList repositoryList;

  @override
  Widget build(BuildContext context) {
    repositoryList = Provider.of<RepositoryList>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          DemoLocalizations.of(context).savedRepositories,
        ),
      ),
      body: ListView.builder(
        itemCount: repositoryList.favoritesItems.length,
        itemBuilder: (context, index) {
          final item = repositoryList.favoritesItems[index];
          return RepositoryCardFavorite(
              value: item,
              onRemove: () {
                item.isFavorite = false;
                repositoryList.update();
              });
        },
      ),
    );
  }
}
