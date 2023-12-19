// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      userId: json['userId'] as String,
      userName: json['name'] as String,
      password: json['passsword'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      phone: json['phone'] as int,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.userName,
      'email': instance.email,
      'passsword': instance.password,
      'role': _$UserRoleEnumMap[instance.role]!,
      'phone': instance.phone,
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.applicant: 'applicant',
  UserRole.employer: 'employer',
};
