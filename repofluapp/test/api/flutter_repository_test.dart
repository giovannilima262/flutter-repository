import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:repofluapp/api/flutter_repository.dart';
import 'package:repofluapp/api/response.dart';

import 'repository_list_values_json.dart';

class MockClient extends Mock implements http.Client {}

void flutterRepositoryTest() {
  group('Get All Repositories', () {
    final MockClient client = MockClient();
    final url = FlutterRepository().url;
    final valuesDefault = RepositoryListValuesJson();
    test('Fetch Success with values', () async {
      final _page = 1;
      final _perPage = 30;
      when(client.get('$url?page=$_page&per_page=$_perPage')).thenAnswer(
          (_) => Future.value(http.Response(valuesDefault.onRepository, 200)));

      var result = await FlutterRepository().allRepositories(
        client: client,
        page: _page,
        perPage: _perPage,
      );

      expect(result, isA<Response>());
      expect(result.status, EnumResponse.success);
    });

    test('Fetch Error', () async {
      final _page = 1;
      final _perPage = 30;
      when(client.get('$url?page=$_page&per_page=$_perPage')).thenAnswer(
          (_) => Future.value(http.Response(valuesDefault.onRepository, 500)));

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
