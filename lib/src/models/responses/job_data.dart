import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_data.g.dart';

@JsonSerializable()
class ApplicantData {
  @JsonKey(name: '_id')
  final String userId;
  @JsonKey(name: 'constituency')
  final String? location;
  final String gender;
  @JsonKey(name: 'highest_education')
  final String highestEducation;

  final List<String> skills;

  ApplicantData({
    required this.userId,
    required this.highestEducation,
    required this.gender,
    this.location,
    required this.skills,
  });

  factory ApplicantData.fromJson(Map<String, dynamic> json) =>
      _$ApplicantDataFromJson(json);
}
