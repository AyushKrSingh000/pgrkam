// 📦 Package imports:

// 🌎 Project imports:

import 'package:pgrkam/src/models/responses/job_data.dart';

import '../../../models/responses/responses.dart';
import '/src/utils/network_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../models/requests/user_login_request.dart';
import 'api_service.dart';

import 'retrofit/auth_api_client/auth_api_client.dart';

class ApiServiceImpl extends ApiService {
  late final AuthApiClient _authApiClient;

  late final Dio dio;

  ApiServiceImpl() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: 20000),
      ),
    );

    _authApiClient = AuthApiClient(dio);
  }

  @override
  Future<ApiResponse<String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authApiClient.signIn(
        userLoginRequest: UserLoginRequest(
          email: email,
          password: password,
        ),
      ) as Map<String, dynamic>;
      if (response['success'] == true) {
        return ApiResponse.success(response['data']);
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      final hasInternet = await hasInternetAccess();
      if (!hasInternet!) {
        return ApiResponse<String>.noInternet();
      }
      return ApiResponse<String>.error('Something went wrong');
    }
  }

  @override
  Future<ApiResponse<String>> verifyOtp({
    required String phone,
    required int code,
  }) async {
    try {
      final response = await _authApiClient.verifyOtp(
        userLoginRequest: UserLoginRequest(
          email: '',
          password: '',
        ),
      );
      return ApiResponse<String>.success(
        response.toString(),
      );
    } catch (e) {
      final hasInternet = await hasInternetAccess();
      if (!hasInternet!) {
        return ApiResponse<String>.noInternet();
      }
      return ApiResponse<String>.error('Something went wrong');
    }
  }

  @override
  Future<ApiResponse<UserData>> fetchUserDetails({
    required String authToken,
  }) async {
    try {
      final response = await _authApiClient.fetchUserData(
        token: authToken,
      ) as Map<String, dynamic>;

      if (response['message'].toString().toLowerCase().trim() ==
          'Successfully completed the request'.toLowerCase()) {
        return ApiResponse.success(UserData.fromJson(response['data']));
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      if (e.runtimeType == DioError &&
          (e as DioError).type == DioErrorType.badResponse &&
          e.response?.statusCode == 401) {
        return ApiResponse<UserData>.authError();
      }
      final hasInternet = await hasInternetAccess();
      if (!hasInternet!) {
        return ApiResponse<UserData>.noInternet();
      }
      return ApiResponse<UserData>.error('Something went wrong');
    }
  }

  @override
  Future<ApiResponse<List<ApplicantData>>> fetchUsersDetails() async {
    try {
      final response =
          await _authApiClient.fetchUsersData() as Map<String, dynamic>;

      if (response['message'].toString().toLowerCase().trim() ==
          'Successfully completed the request'.toLowerCase()) {
        return ApiResponse.success((response['data'] as List)
            .map((e) => ApplicantData.fromJson(e))
            .toList());
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      if (e.runtimeType == DioError &&
          (e as DioError).type == DioErrorType.badResponse &&
          e.response?.statusCode == 401) {
        return ApiResponse<List<ApplicantData>>.authError();
      }
      final hasInternet = await hasInternetAccess();
      if (!hasInternet!) {
        return ApiResponse<List<ApplicantData>>.noInternet();
      }
      return ApiResponse<List<ApplicantData>>.error('Something went wrong');
    }
  }

  @override
  Future<ApiResponse<List<List<String>>>> fetchJobsDetails() async {
    try {
      final response =
          await _authApiClient.fetchJobsData() as Map<String, dynamic>;

      if (response['message'].toString().toLowerCase().trim() ==
          'Successfully completed the request'.toLowerCase()) {
        return ApiResponse.success((response['data'] as List)
            .map((e) =>
                ((e as Map<String, dynamic>)['industry'] ?? []) as List<String>)
            .toList());
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      if (e.runtimeType == DioError &&
          (e as DioError).type == DioErrorType.badResponse &&
          e.response?.statusCode == 401) {
        return ApiResponse<List<List<String>>>.authError();
      }
      final hasInternet = await hasInternetAccess();
      if (!hasInternet!) {
        return ApiResponse<List<List<String>>>.noInternet();
      }
      return ApiResponse<List<List<String>>>.error('Something went wrong');
    }
  }
}
