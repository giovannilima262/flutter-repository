import 'package:flutter/material.dart';

class Response {
  const Response({
    @required this.status,
    this.value,
  });
  final EnumResponse status;
  final dynamic value;
}

enum EnumResponse {
  error,
  success,
  process,
}
