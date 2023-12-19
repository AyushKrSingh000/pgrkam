import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/responses/responses.dart';
import 'api_service_impl.dart';

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiServiceImpl(),
);

abstract class ApiService {
  Future<ApiResponse<bool>> signIn({
    required String email,
    required String password,
  });
  Future<ApiResponse<String>> verifyOtp({
    required String phone,
    required int code,
  });
  Future<ApiResponse<UserData>> fetchUserDetails({
    required String authToken,
  });
}
