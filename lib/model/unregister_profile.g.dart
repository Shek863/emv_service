// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unregister_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnregisterProfile _$UnregisterProfileFromJson(Map<String, dynamic> json) =>
    UnregisterProfile(
      json['is_unregistered'] as bool? ?? false,
      json['reason'] as String? ?? '',
      json['user_profile_id'] as String? ?? '',
      json['server_error'] as bool? ?? false,
    );

Map<String, dynamic> _$UnregisterProfileToJson(UnregisterProfile instance) =>
    <String, dynamic>{
      'is_unregistered': instance.unregistered,
      'reason': instance.reason,
      'user_profile_id': instance.uuid,
      'server_error': instance.serverError,
    };
