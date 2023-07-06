// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfile _$UpdateProfileFromJson(Map<String, dynamic> json) =>
    UpdateProfile(
      json['is_updated'] as bool? ?? false,
      json['reason'] as String? ?? '',
      json['user_profile_id'] as String? ?? '',
      json['mobile_device_id'] as String? ?? '',
      json['first_name'] as String? ?? '',
      json['surname'] as String? ?? '',
      json['email_address'] as String? ?? '',
      json['server_error'] as bool? ?? false,
    );

Map<String, dynamic> _$UpdateProfileToJson(UpdateProfile instance) =>
    <String, dynamic>{
      'is_updated': instance.updated,
      'reason': instance.reason,
      'user_profile_id': instance.uuid,
      'mobile_device_id': instance.deviceId,
      'first_name': instance.firstName,
      'surname': instance.surname,
      'email_address': instance.email,
      'server_error': instance.serverError,
    };
