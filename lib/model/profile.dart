import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  // SERVER STATUS AND REASONS
  @JsonKey(name: 'is_registered', defaultValue: false)
  bool registered;
  @JsonKey(name: 'terminal_registered', defaultValue: false)
  bool terminalRegistered;
  @JsonKey(name: 'profile_blocked', defaultValue: false)
  bool profileBlocked;
  @JsonKey(name: 'terminal_blocked', defaultValue: false)
  bool terminalBlocked;
  @JsonKey(name: 'server_error', defaultValue: false)
  bool serverError;
  @JsonKey(name: 'reason', defaultValue: '')
  String reason;

  // PROFILE PROPERTIES
  @JsonKey(name: 'user_profile_id', defaultValue: '')
  final String uuid;
  @JsonKey(name: 'surname', defaultValue: '')
  final String lastName;
  @JsonKey(name: 'first_name', defaultValue: '')
  final String firstName;
  @JsonKey(name: 'mobile_device_id', defaultValue: '')
  final String deviceId;
  @JsonKey(name: 'msisdn', defaultValue: '')
  final String mobileNumber;
  @JsonKey(name: 'bank_terminal_id', defaultValue: '')
  final String bankTerminalId;
  @JsonKey(name: 'terminal_id', defaultValue: '')
  final String terminalId;

  Profile(
    this.registered,
    this.terminalRegistered,
    this.profileBlocked,
    this.terminalBlocked,
    this.serverError,
    this.reason,
    this.uuid,
    this.lastName,
    this.firstName,
    this.deviceId,
    this.mobileNumber,
    this.bankTerminalId,
    this.terminalId,
  );

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
