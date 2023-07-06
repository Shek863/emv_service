import 'package:json_annotation/json_annotation.dart';

part 'unregister_profile.g.dart';

@JsonSerializable()
class UnregisterProfile {
  @JsonKey(name: 'is_unregistered', defaultValue: false)
  bool unregistered;
  @JsonKey(name: 'reason', defaultValue: '')
  String reason;
  @JsonKey(name: 'user_profile_id', defaultValue: '')
  String uuid;
  @JsonKey(name: 'server_error', defaultValue: false)
  bool serverError;


  UnregisterProfile(
    this.unregistered,
    this.reason,
    this.uuid,
    this.serverError
  );

  Map<String, dynamic> toJson() => _$UnregisterProfileToJson(this);

  factory UnregisterProfile.fromJson(Map<String, dynamic> json) =>
      _$UnregisterProfileFromJson(json);
}
