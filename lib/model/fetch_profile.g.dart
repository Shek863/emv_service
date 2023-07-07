// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchProfile _$FetchProfileFromJson(Map<String, dynamic> json) => FetchProfile(
      json['found'] as bool? ?? false,
      json['reason'] as String? ?? '',
      json['user_profile_id'] as String? ?? '',
      json['first_name'] as String? ?? '',
      json['surname'] as String? ?? '',
      json['email_address'] as String? ?? '',
      json['server_error'] as bool? ?? false,
    );

Map<String, dynamic> _$FetchProfileToJson(FetchProfile instance) =>
    <String, dynamic>{
      'found': instance.found,
      'reason': instance.reason,
      'user_profile_id': instance.uuid,
      'first_name': instance.firstName,
      'surname': instance.surname,
      'email_address': instance.email,
      'server_error': instance.serverError,
    };
