import '/src/logic/services/api_services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_page_model.freezed.dart';

final authPageModelProvider =
    StateNotifierProvider.autoDispose<AuthPageModel, AuthPageState>(
  (ref) => AuthPageModel(
    apiService: ref.watch(apiServiceProvider),
    ref: ref,
  ),
);

class AuthPageModel extends StateNotifier<AuthPageState> {
  final ApiService apiService;
  final AutoDisposeStateNotifierProviderRef ref;

  AuthPageModel({
    required this.apiService,
    required this.ref,
  }) : super(const AuthPageState());

  setEmail(String value) => state = state.copyWith(
        mobile: value,
        status: AuthPageStatus.initial,
      );
  setPassword(String value) => state = state.copyWith(
        password: value,
        status: AuthPageStatus.initial,
      );

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
    @Default(AuthPageStatus.initial) AuthPageStatus status,
    // @Default(true) bool isTncAccepted,
    // @Default(AuthScreen.login) AuthScreen activeScreen,
    String? errorMessage,
  }) = _AuthPageState;
}

enum AuthScreen {
  login,
  otpVerification,
}

enum AuthPageStatus {
  initial,
  processing,
  error,
}
