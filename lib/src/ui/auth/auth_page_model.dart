import 'package:pgrkam/src/logic/repositories/auth_repository/auth_repository.dart';
import 'package:pgrkam/src/logic/services/preference_services.dart';
import 'package:pgrkam/src/models/responses/api_response.dart';

import '/src/logic/services/api_services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_page_model.freezed.dart';

final authPageModelProvider =
    StateNotifierProvider.autoDispose<AuthPageModel, AuthPageState>(
  (ref) => AuthPageModel(
    apiService: ref.watch(apiServiceProvider),
    preferenceService: ref.read(preferenceServiceProvider),
    ref: ref,
  ),
);

class AuthPageModel extends StateNotifier<AuthPageState> {
  final ApiService apiService;
  final PreferenceService preferenceService;
  final AutoDisposeStateNotifierProviderRef ref;

  AuthPageModel({
    required this.apiService,
    required this.ref,
    required this.preferenceService,
  }) : super(const AuthPageState());

  setEmail(String value) => state = state.copyWith(
        mobile: value,
        status: AuthPageStatus.initial,
      );
  setPassword(String value) => state = state.copyWith(
        password: value,
        status: AuthPageStatus.initial,
      );
  setAuthScreenStatus(AuthScreen status) {
    state = state.copyWith(activeScreen: status);
  }

  setMobile(int mobile) => state = state.copyWith(mobiles: mobile);
  setName(String name) => state = state.copyWith(name: name);
  setRole(UserType userType) => state = state.copyWith(userType: userType);

  Future<String> login() async {
    try {
      final res = await apiService.signIn(
          email: state.mobile, password: state.password);
      if (res.status != ApiStatus.success) {
        return res.errorMessage ?? 'Something Went Wrong';
      } else {
        await preferenceService.setString(
          PreferenceService.authToken,
          res.data!,
        );

        await ref.read(authRepositoryProvider.notifier).fetchUserDetails();
        return '';
      }
    } catch (e) {
      return e.toString();
    }
  }

  setError(String? error) => state = state.copyWith(
        errorMessage: error,
        status: AuthPageStatus.error,
      );
}

@freezed
class AuthPageState with _$AuthPageState {
  const factory AuthPageState({
    @Default('') String mobile,
    @Default('') String password,
    @Default('') String name,
    @Default(0) int mobiles,
    @Default(UserType.applicant) UserType userType,
    @Default(AuthPageStatus.initial) AuthPageStatus status,
    // @Default(true) bool isTncAccepted,
    @Default(AuthScreen.signIn) AuthScreen activeScreen,
    String? errorMessage,
  }) = _AuthPageState;
}

enum AuthScreen {
  signIn,
  signUp,
}

enum AuthPageStatus {
  initial,
  processing,
  error,
}

enum UserType { employer, applicant }
