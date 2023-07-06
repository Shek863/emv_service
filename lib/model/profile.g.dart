// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      json['is_registered'] as bool? ?? false,
      json['terminal_registered'] as bool? ?? false,
      json['profile_blocked'] as bool? ?? false,
      json['terminal_blocked'] as bool? ?? false,
      json['server_error'] as bool? ?? false,
      json['reason'] as String? ?? '',
      json['user_profile_id'] as String? ?? '',
      json['surname'] as String? ?? '',
      json['first_name'] as String? ?? '',
      json['mobile_device_id'] as String? ?? '',
      json['msisdn'] as String? ?? '',
      json['bank_terminal_id'] as String? ?? '',
      json['terminal_id'] as String? ?? '',
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'is_registered': instance.registered,
      'terminal_registered': instance.terminalRegistered,
      'profile_blocked': instance.profileBlocked,
      'terminal_blocked': instance.terminalBlocked,
      'server_error': instance.serverError,
      'reason': instance.reason,
      'user_profile_id': instance.uuid,
      'surname': instance.lastName,
      'first_name': instance.firstName,
      'mobile_device_id': instance.deviceId,
      'msisdn': instance.mobileNumber,
      'bank_terminal_id': instance.bankTerminalId,
      'terminal_id': instance.terminalId,
    };
