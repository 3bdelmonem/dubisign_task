import 'package:dio/dio.dart';
import 'package:dubisign_task/core/util/api_basehelper.dart';

class ServerException implements Exception {
  final String message;
  final CodeStatus code;
  final Map<String, dynamic>? errors;
  final Response? respnose;
  ServerException({
    this.respnose,
    required this.message,
    this.errors,
    this.code = CodeStatus.defaultCode,
  });
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException({required this.message});
}
