import 'package:json_annotation/json_annotation.dart';

part 'fetch_profile.g.dart';

@JsonSerializable()
class FetchProfile {
  @JsonKey(name: 'found', defaultValue: false)
  bool found;
  @JsonKey(name: 'reason', defaultValue: '')
  String reason;
  @JsonKey(name: 'user_profile_id', defaultValue: '')
  String uuid;
  @JsonKey(name: 'first_name', defaultValue: '')
  String firstName;
  @JsonKey(name: 'surname', defaultValue: '')
  String surname;
  @JsonKey(name: 'email_address', defaultValue: '')
  String email;
  @JsonKey(name: 'server_error', defaultValue: false)
  bool serverError;


  FetchProfile(
    this.found,
    this.reason,
    this.uuid,
    this.firstName,
    this.surname,
    this.email,
    this.serverError
  );

  Map<String, dynamic> toJson() => _$FetchProfileToJson(this);

  factory FetchProfile.fromJson(Map<String, dynamic> json) =>
      _$FetchProfileFromJson(json);
}
