import 'package:json_annotation/json_annotation.dart';

part 'terminal.g.dart';

@JsonSerializable()
class Terminal {
  @JsonKey(name: 'is_registered', defaultValue: false)
  bool registered;
  @JsonKey(name: 'reason', defaultValue: '')
  String reason;
  @JsonKey(name: 'device_id', defaultValue: '')
  String deviceId;
  @JsonKey(name: 'server_error', defaultValue: false)
  bool serverError;


  Terminal(
    this.registered,
    this.reason,
    this.deviceId,
    this.serverError
  );

  Map<String, dynamic> toJson() => _$TerminalToJson(this);

  factory Terminal.fromJson(Map<String, dynamic> json) =>
      _$TerminalFromJson(json);
}
