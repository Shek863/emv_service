class RegistrationRequest {
  String? otp;
  String? merchantId;
  String? terminalId;

  RegistrationRequest({
    this.otp,
    this.merchantId,
    this.terminalId,
  });

  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'terminalId': terminalId,
      'merchantId': merchantId,
    };
  }
}
