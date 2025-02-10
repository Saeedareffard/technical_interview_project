import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:technical_question/core/network_handlers/dio_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.interceptors.add(NetworkErrorInterceptor(DefaultErrorParser()));
  return dio;
});
