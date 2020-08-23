import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:repofluapp/api/response.dart';
import 'package:repofluapp/components/message_error.dart';
import 'package:repofluapp/components/repository_card.dart';
import 'package:repofluapp/language/demo_localizations.dart';
import 'package:repofluapp/providers/repository_list.dart';
import 'package:repofluapp/routes/pages_app.dart';
import 'package:repofluapp/utils/size_route.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RepositoryList repositoryList;

  @override
  void initState() {
    Provider.of<RepositoryList>(
      context,
      listen: false,
    ).getAllRepositories();
    super.initState();
  }

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
          DemoLocalizations.of(context).appName,
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text('${repositoryList.favoritesItems.length}'),
              IconButton(
                icon: Icon(Icons.bookmark),
                onPressed: () => Navigator.push(
                  context,
                  SizeRoute(page: PagesApp.favorite),
                ),
              )
            ],
          )
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (repositoryList.statusFetching != EnumResponse.process &&
              repositoryList.statusFetching != EnumResponse.error &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            repositoryList.initFetching();
            repositoryList.getAllRepositories();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: repositoryList.items.length + 1,
          itemBuilder: (context, index) {
            if (repositoryList.items.length == index) {
              return (repositoryList.statusFetching == EnumResponse.process ||
                      repositoryList.statusFetching == null)
                  ? Center(
                      child: LoadingFadingLine.square(
                        size: 30,
                        backgroundColor: Colors.blue,
                      ),
                    )
                  : (repositoryList.statusFetching == EnumResponse.error)
                      ? MessageError(
                          onPressed: () {
                            repositoryList.initFetching();
                            repositoryList.getAllRepositories();
                          },
                        )
                      : Container();
            }
            final item = repositoryList.items[index];
            return RepositoryCard(
              value: item,
              onSave: !item.isFavorite
                  ? () {
                      item.isFavorite = true;
                      repositoryList.update();
                    }
                  : null,
            );
          },
        ),
      ),
    );
  }
}
