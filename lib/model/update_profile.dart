import 'package:json_annotation/json_annotation.dart';

part 'update_profile.g.dart';

@JsonSerializable()
class UpdateProfile {
  @JsonKey(name: 'is_updated', defaultValue: false)
  bool updated;
  @JsonKey(name: 'reason', defaultValue: '')
  String reason;
  @JsonKey(name: 'user_profile_id', defaultValue: '')
  String uuid;
  @JsonKey(name: 'mobile_device_id', defaultValue: '')
  String deviceId;
  @JsonKey(name: 'first_name', defaultValue: '')
  String firstName;
  @JsonKey(name: 'surname', defaultValue: '')
  String surname;
  @JsonKey(name: 'email_address', defaultValue: '')
  String email;
  @JsonKey(name: 'server_error', defaultValue: false)
  bool serverError;


  UpdateProfile(
    this.updated,
    this.reason,
    this.uuid,
    this.deviceId,
    this.firstName,
    this.surname,
    this.email,
    this.serverError
  );

  Map<String, dynamic> toJson() => _$UpdateProfileToJson(this);

  factory UpdateProfile.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileFromJson(json);
}
