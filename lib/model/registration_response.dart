class RegistrationResponse {
  final bool isSuccess;
  final String message;

  RegistrationResponse({
    required this.message,
    required this.isSuccess,
  });

  static RegistrationResponse fromJson(Map<Object?, Object?> json) {
    return RegistrationResponse(
      isSuccess: json['status']! as bool,
      message: json['message']! as String,
    );
  }
}
