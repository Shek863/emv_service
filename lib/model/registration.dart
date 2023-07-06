import 'package:json_annotation/json_annotation.dart';

part 'registration.g.dart';

@JsonSerializable()
class Registration {
  @JsonKey(name: 'is_registered', defaultValue: false)
  bool registered;
  @JsonKey(name: 'reason', defaultValue: '')
  String reason;
  @JsonKey(name: 'terminal_id', defaultValue: '')
  String terminalId;
  @JsonKey(name: 'mobile_device_id', defaultValue: '')
  String mobileId;
  @JsonKey(name: 'bank_terminal_id', defaultValue: '')
  String bankTerminalId;
  @JsonKey(name: 'msisdn', defaultValue: '')
  String msisdn;
  @JsonKey(name: 'terminal_blocked', defaultValue: false)
  bool terminalBlocked;
  @JsonKey(name: 'server_error', defaultValue: false)
  bool serverError;
  @JsonKey(name: 'meta')
  Map<String, dynamic> meta;

  Registration(
    this.registered,
    this.reason,
    this.terminalId,
    this.mobileId,
    this.bankTerminalId,
    this.msisdn,
    this.terminalBlocked,
    this.serverError,
    this.meta,
  );

  Map<String, dynamic> toJson() => _$RegistrationToJson(this);

  factory Registration.fromJson(Map<String, dynamic> json) =>
      _$RegistrationFromJson(json);
}
