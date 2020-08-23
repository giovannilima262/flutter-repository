import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:repofluapp/api/response.dart';

class FlutterRepository {
  final url = 'https://api.github.com/orgs/flutter/repos';

  Future<Response> allRepositories({
    http.Client client,
    int page = 1,
    int perPage = 30,
  }) async {
    try {
      var urlValue = '$url?page=$page&per_page=$perPage';
      var response =
          await (client != null ? client.get(urlValue) : http.get(urlValue));
      if (response.statusCode == 200) {
        return Response(
          status: EnumResponse.success,
          value: convert.jsonDecode(response.body),
        );
      }
    } catch (e) {}
    return Response(
      status: EnumResponse.error,
    );
  }
}
