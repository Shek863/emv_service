// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terminal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Terminal _$TerminalFromJson(Map<String, dynamic> json) => Terminal(
      json['is_registered'] as bool? ?? false,
      json['reason'] as String? ?? '',
      json['device_id'] as String? ?? '',
      json['server_error'] as bool? ?? false,
    );

Map<String, dynamic> _$TerminalToJson(Terminal instance) => <String, dynamic>{
      'is_registered': instance.registered,
      'reason': instance.reason,
      'device_id': instance.deviceId,
      'server_error': instance.serverError,
    };
