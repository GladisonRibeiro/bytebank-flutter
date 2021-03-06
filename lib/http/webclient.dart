import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptor.dart';

final Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()], requestTimeout: Duration(seconds: 5));

const String baseURL = 'http://192.168.15.5:8080/transactions';
