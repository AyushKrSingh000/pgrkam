// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicantData _$ApplicantDataFromJson(Map<String, dynamic> json) =>
    ApplicantData(
      userId: json['_id'] as String,
      highestEducation: json['highest_education'] as String,
      gender: json['gender'] as String,
      location: json['constituency'] as String?,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ApplicantDataToJson(ApplicantData instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'constituency': instance.location,
      'gender': instance.gender,
      'highest_education': instance.highestEducation,
      'skills': instance.skills,
    };
