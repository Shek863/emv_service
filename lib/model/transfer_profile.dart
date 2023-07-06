import 'package:json_annotation/json_annotation.dart';

part 'transfer_profile.g.dart';

@JsonSerializable()
class TransferProfile {
  @JsonKey(name: 'is_transferred', defaultValue: false)
  bool transferred;
  @JsonKey(name: 'reason', defaultValue: '')
  String reason;
  @JsonKey(name: 'old_mobile_device_id', defaultValue: '')
  String oldDeviceId;
  @JsonKey(name: 'old_msisdn', defaultValue: '')
  String oldMsisdn;
  @JsonKey(name: 'new_msisdn', defaultValue: '')
  String newMsisdn;
  @JsonKey(name: 'otp', defaultValue: '')
  String otp;
  @JsonKey(name: 'device_id', defaultValue: '')
  String deviceId;
  @JsonKey(name: 'server_error', defaultValue: false)
  bool serverError;


  TransferProfile(
    this.transferred,
    this.reason,
    this.oldDeviceId,
    this.oldMsisdn,
    this.newMsisdn,
    this.otp,
    this.deviceId,
    this.serverError
  );

  Map<String, dynamic> toJson() => _$TransferProfileToJson(this);

  factory TransferProfile.fromJson(Map<String, dynamic> json) =>
      _$TransferProfileFromJson(json);
}
