import 'package:flutter_test/flutter_test.dart';
import 'package:repofluapp/models/repository.dart';

import '../default_values/repository_list_values_json.dart';

void flutterRepositoryModelTest() {
  group('Repository Model', () {
    final valuesDefault = RepositoryListValuesJson();
    test('convert string in object repository model', () {
      var valueListDefault = valuesDefault.oneRepository();
      List<RepositoryModel> list =
          RepositoryModel.convertJsonList(valueListDefault.object);

      expect(list.length, 1);
      expect(list[0].id, valueListDefault.object[0]["id"]);
      expect(list[0].name, valueListDefault.object[0]["name"]);
      expect(list[0].description, valueListDefault.object[0]["description"]);
      expect(list[0].createdAt, valueListDefault.object[0]["created_at"]);
      expect(list[0].language, valueListDefault.object[0]["language"]);
      expect(
        list[0].stargazersCount,
        valueListDefault.object[0]["stargazers_count"],
      );
    });
  });
}
