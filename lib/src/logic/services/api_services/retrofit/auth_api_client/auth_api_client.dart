import '../../../../../models/requests/user_login_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@RestApi(baseUrl: 'https://pgrkam.onrender.com/api/v1')
abstract class AuthApiClient {
  factory AuthApiClient(
    Dio dio, {
    String baseUrl,
  }) = _AuthApiClient;

  @POST('signin')
  Future signIn({
    @Body() required UserLoginRequest userLoginRequest,
  });
  @GET('/auth/me')
  Future fetchUserData({
    @Header('Authorization') required String token,
  });
  @POST('/auth/verify_otp')
  Future verifyOtp({
    @Body() required UserLoginRequest userLoginRequest,
  });
}
