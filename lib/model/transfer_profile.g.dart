// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferProfile _$TransferProfileFromJson(Map<String, dynamic> json) =>
    TransferProfile(
      json['is_transferred'] as bool? ?? false,
      json['reason'] as String? ?? '',
      json['old_mobile_device_id'] as String? ?? '',
      json['old_msisdn'] as String? ?? '',
      json['new_msisdn'] as String? ?? '',
      json['otp'] as String? ?? '',
      json['device_id'] as String? ?? '',
      json['server_error'] as bool? ?? false,
    );

Map<String, dynamic> _$TransferProfileToJson(TransferProfile instance) =>
    <String, dynamic>{
      'is_transferred': instance.transferred,
      'reason': instance.reason,
      'old_mobile_device_id': instance.oldDeviceId,
      'old_msisdn': instance.oldMsisdn,
      'new_msisdn': instance.newMsisdn,
      'otp': instance.otp,
      'device_id': instance.deviceId,
      'server_error': instance.serverError,
    };
