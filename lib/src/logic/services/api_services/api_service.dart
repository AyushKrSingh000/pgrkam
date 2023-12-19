import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pgrkam/src/models/responses/job_data.dart';

import '../../../models/responses/responses.dart';
import 'api_service_impl.dart';

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiServiceImpl(),
);

abstract class ApiService {
  Future<ApiResponse<String>> signIn({
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
  Future<ApiResponse<List<ApplicantData>>> fetchUsersDetails();
  Future<ApiResponse<List<List<String>>>> fetchJobsDetails();
}
