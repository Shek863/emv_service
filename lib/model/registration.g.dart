// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Registration _$RegistrationFromJson(Map<String, dynamic> json) => Registration(
      json['is_registered'] as bool? ?? false,
      json['reason'] as String? ?? '',
      json['terminal_id'] as String? ?? '',
      json['mobile_device_id'] as String? ?? '',
      json['bank_terminal_id'] as String? ?? '',
      json['msisdn'] as String? ?? '',
      json['terminal_blocked'] as bool? ?? false,
      json['server_error'] as bool? ?? false,
      json['meta'] as Map<String, dynamic>,
      json['surname'] as String? ?? '',
      json['first_name'] as String? ?? '',
      json['otp'] as String? ?? '',
    );

Map<String, dynamic> _$RegistrationToJson(Registration instance) =>
    <String, dynamic>{
      'is_registered': instance.registered,
      'reason': instance.reason,
      'terminal_id': instance.terminalId,
      'mobile_device_id': instance.mobileId,
      'bank_terminal_id': instance.bankTerminalId,
      'msisdn': instance.msisdn,
      'terminal_blocked': instance.terminalBlocked,
      'server_error': instance.serverError,
      'meta': instance.meta,
      'surname': instance.lastName,
      'first_name': instance.firstName,
      'otp': instance.otp,
    };
