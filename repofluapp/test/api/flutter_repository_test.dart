import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:repofluapp/api/flutter_repository.dart';
import 'package:repofluapp/api/response.dart';

import '../default_values/repository_list_values_json.dart';

class MockClient extends Mock implements http.Client {}

void flutterRepositoryTest() {
  group('Get All Repositories', () {
    final MockClient client = MockClient();
    final url = FlutterRepository().url;
    final valuesDefault = RepositoryListValuesJson();
    test('fetch success with values', () async {
      final _page = 1;
      final _perPage = 30;
      when(client.get('$url?page=$_page&per_page=$_perPage')).thenAnswer((_) =>
          Future.value(http.Response(valuesDefault.oneRepository().value, 200)));

      var result = await FlutterRepository().allRepositories(
        client: client,
        page: _page,
        perPage: _perPage,
      );

      expect(result, isA<Response>());
      expect(result.status, EnumResponse.success);
    });

    test('fetch error', () async {
      final _page = 1;
      final _perPage = 30;
      when(client.get('$url?page=$_page&per_page=$_perPage')).thenAnswer((_) =>
          Future.value(http.Response(valuesDefault.oneRepository().value, 500)));

      var result = await FlutterRepository().allRepositories(
        client: client,
        page: _page,
        perPage: _perPage,
      );

      expect(result, isA<Response>());
      expect(result.status, EnumResponse.error);
    });
  });
}
