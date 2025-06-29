import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../api_client.dart';

class DioApiClient implements ApiClient {
  DioApiClient() {
    _dio = _onInit();
  }

  // ignore: unused_field
  late Dio _dio;

  Dio _onInit() {
    final dio = Dio();
    dio.options.baseUrl = '';
    dio.options.sendTimeout = const Duration(minutes: 1);
    dio.options.connectTimeout = const Duration(minutes: 1);
    dio.options.receiveTimeout = const Duration(minutes: 1);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (kDebugMode) {
            if (options.data is FormData) {
              FormData d = options.data;
              d.fields.forEach(
                ((field) => debugPrint('Fields: ${field.key}: ${field.value}')),
              );
              for (var field in d.files) {
                debugPrint(
                  'Files: ${field.key}: ${field.value.filename} ${field.value.contentType?.mimeType}',
                );
              }
            }
          }
          return handler.next(options);
        },
      ),
    );

    // Add logging interceptor with debug check.
    dio.interceptors.add(
      LogInterceptor(
        request: kDebugMode,
        error: kDebugMode,
        responseHeader: kDebugMode,
        requestBody: kDebugMode,
        requestHeader: kDebugMode,
        responseBody: kDebugMode,
      ),
    );

    return dio;
  }

  // void _addAuthorizationTokenInHeader({
  //   bool? isToken = false,
  //   String? userToken,
  // }) {
  //   if (isToken!) {
  //     _dio.options.headers["authorisation:"] = userToken;
  //   } else {
  //     final token = SessionManager.getToken();
  //     if (token.isNotEmpty) {
  //       _dio.options.headers["authorisation"] = token;
  //     }
  //   }
  // }

  // void _removeAuthorizationTokenFromHeader() {
  //   _dio.options.headers.remove("Authorization:");
  // }

  // @override
  // login(request) async {
  //   final response = await _dio.post<Map<String, dynamic>>(
  //     ApiConstants.LOGIN,
  //     data: FormData.fromMap(request.toJson()),
  //   );

  //   return response;
  // }

  // @override
  // signUp(request) async {
  //   final response = await _dio.post<Map<String, dynamic>>(
  //     ApiConstants.SIGN_UP,
  //     data: FormData.fromMap(request.toJson()),
  //   );

  //   return response;
  // }

  // @override
  // verifyOtp(request) async {
  //   final response = await _dio.post<Map<String, dynamic>>(
  //     request.params is SignUpParams
  //         ? ApiConstants.VERIFY_SIGN_UP_OTP
  //         : ApiConstants.VERIFY_LOGIN_OTP,
  //     data: FormData.fromMap(request.toJson()),
  //   );

  //   return response;
  // }

  // @override
  // resendOtp(request) async {
  //   final response = await _dio.post<Map<String, dynamic>>(
  //     ApiConstants.RESEND_OTP,
  //     data: FormData.fromMap(request.toJson()),
  //   );

  //   return response;
  // }
}
