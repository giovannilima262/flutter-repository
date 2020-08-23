import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:repofluapp/api/flutter_repository.dart';
import 'package:repofluapp/api/response.dart';
import 'package:repofluapp/models/repository.dart';

class RepositoryList extends ChangeNotifier {
  final flutterRepository = FlutterRepository();
  final List<RepositoryModel> _items = [];
  int _page = 1;
  int _perPage = 30;
  bool _isFetching = false;
  EnumResponse _statusFetching;

  UnmodifiableListView<RepositoryModel> get items =>
      UnmodifiableListView(_items);

  bool get isFetching => _isFetching;
  EnumResponse get statusFetching => _statusFetching;
  List<RepositoryModel> get favoritesItems =>
      _items.where((i) => i.isFavorite).toList();

  void update() {
    notifyListeners();
  }

  void initFetching() {
    _statusFetching = EnumResponse.process;
    notifyListeners();
  }

  void getAllRepositories() {
    flutterRepository
        .allRepositories(page: _page, perPage: _perPage)
        .then((data) {
      _statusFetching = data.status;
      if (data.status == EnumResponse.error) {
        notifyListeners();
        return;
      }
      List<RepositoryModel> list = RepositoryModel.convertJsonList(data.value);
      if (list.isEmpty) {
        notifyListeners();
        return;
      }
      _items.addAll(list);
      _page++;
      notifyListeners();
    });
  }
}
