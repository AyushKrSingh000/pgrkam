import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final String userId;
  @JsonKey(name: 'name')
  final String userName;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'passsword')
  final String password;
  @JsonKey(name: 'role')
  final UserRole role;
  final int phone;

  UserData({
    required this.userId,
    required this.userName,
    required this.password,
    required this.role,
    required this.phone,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

enum UserRole {
  admin,
  applicant,
  employer,
}
