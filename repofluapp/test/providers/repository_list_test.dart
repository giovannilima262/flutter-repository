import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:repofluapp/api/flutter_repository.dart';
import 'package:repofluapp/api/response.dart';
import 'package:repofluapp/models/repository.dart';
import 'package:repofluapp/providers/repository_list.dart';
import '../default_values/repository_list_values_json.dart';

class MockClient extends Mock implements http.Client {}

void flutterRepositoryListProviderTest() {
  group('Repository list provider', () {
    final MockClient client = MockClient();
    final url = FlutterRepository().url;
    var valueListOneDefault = RepositoryListValuesJson().oneRepository();
    var valueListManyDefault = RepositoryListValuesJson().manyRepository();
    test('add one repository in provider', () {
      final _page = 1;
      final _perPage = 30;
      var provider = RepositoryList();

      when(client.get('$url?page=$_page&per_page=$_perPage')).thenAnswer(
          (_) => Future.value(http.Response(valueListOneDefault.value, 200)));

      List<RepositoryModel> list = provider.items;
      provider.getAllRepositories(client);
      provider.addListener(() {
        expect(list.length, 1);
        expect(provider.statusFetching, EnumResponse.success);
        expect(list[0].id, valueListOneDefault.object[0]["id"]);
        expect(list[0].name, valueListOneDefault.object[0]["name"]);
        expect(
            list[0].description, valueListOneDefault.object[0]["description"]);
        expect(list[0].createdAt, valueListOneDefault.object[0]["created_at"]);
        expect(list[0].language, valueListOneDefault.object[0]["language"]);
        expect(
          list[0].stargazersCount,
          valueListOneDefault.object[0]["stargazers_count"],
        );
      });
    });
    test('fetching init', () {
      var provider = RepositoryList();
      provider.initFetching();
      expect(provider.statusFetching, EnumResponse.process);
    });

    test('fetching error', () {
      final _page = 1;
      final _perPage = 30;

      var provider = RepositoryList();

      when(client.get('$url?page=$_page&per_page=$_perPage')).thenAnswer(
          (_) => Future.value(http.Response(valueListOneDefault.value, 500)));

      List<RepositoryModel> list = provider.items;

      provider.getAllRepositories(client);
      provider.addListener(() {
        expect(list.length, 0);
        expect(provider.statusFetching, EnumResponse.error);
      });
    });
    test('fetching empty', () {
      final _page = 1;
      final _perPage = 30;
      var provider = RepositoryList();

      when(client.get('$url?page=$_page&per_page=$_perPage'))
          .thenAnswer((_) => Future.value(http.Response('[]', 200)));

      List<RepositoryModel> list = provider.items;

      provider.getAllRepositories(client);
      provider.addListener(() {
        expect(list.length, 0);
        expect(provider.statusFetching, EnumResponse.success);
      });
    });

    test('set favorite list', () {
      final _page = 1;
      final _perPage = 30;
      var provider = RepositoryList();

      when(client.get('$url?page=$_page&per_page=$_perPage')).thenAnswer(
          (_) => Future.value(http.Response(valueListManyDefault.value, 200)));

      provider.getAllRepositories(client);
      provider.addListener(() {
        provider.items[0].isFavorite = true;
        List<RepositoryModel> list = provider.favoritesItems;
        expect(provider.items.length, 2);
        expect(list.length, 1);
        expect(list[0].id, valueListOneDefault.object[0]["id"]);
        expect(list[0].name, valueListOneDefault.object[0]["name"]);
        expect(
            list[0].description, valueListOneDefault.object[0]["description"]);
        expect(list[0].createdAt, valueListOneDefault.object[0]["created_at"]);
        expect(list[0].language, valueListOneDefault.object[0]["language"]);
        expect(
          list[0].stargazersCount,
          valueListOneDefault.object[0]["stargazers_count"],
        );
        expect(list[0].isFavorite, isTrue);
      });
    });
  });
}
