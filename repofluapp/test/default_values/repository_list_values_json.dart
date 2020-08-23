import 'dart:convert';

class RepositoryListValuesJson {
  var repository1 =
      '{ "id": 1, "name": "test", "description": "test description", "created_at": "2015-03-06T22:54:58Z", "language": "test", "stargazers_count": 130 }';
  var repository2 =
      '{ "id": 2, "name": "test2", "description": "test description", "created_at": "2016-03-06T22:54:58Z", "language": "test2", "stargazers_count": 60 }';

  RepositoryListValuesJsonModel oneRepository() {
    return RepositoryListValuesJsonModel(
      object: jsonDecode('[$repository1]'),
      value: '[$repository1]',
    );
  }

  RepositoryListValuesJsonModel manyRepository() {
    return RepositoryListValuesJsonModel(
      object: jsonDecode('[$repository1, $repository2]'),
      value: '[$repository1, $repository2]',
    );
  }
}

class RepositoryListValuesJsonModel {
  const RepositoryListValuesJsonModel({this.object, this.value});
  final dynamic object;
  final String value;
}
