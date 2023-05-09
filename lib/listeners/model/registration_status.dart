class RegistrationStatus {
  String? uuid;
  String? message;
  String? deviceId;
  String? lastName;
  String? firstName;
  String? terminalId;
  final bool success;
  String? merchantId;
  String? merchantCode;
  String? merchantName;
  String? mobileNumber;

  RegistrationStatus({required this.success, this.message});

  RegistrationStatus.fromJson(Map<String, dynamic> json)
      : message = json['reason'],
        deviceId = json['deviceId'],
        success = json['is_registered'],
        terminalId = json['terminalId'],
        merchantId = json['merchant_id'],
        uuid = json['profile_id'] ?? '',
        lastName = json['surname'] ?? '',
        mobileNumber = json['msisdn'] ?? '',
        firstName = json['first_name'] ?? '',
        merchantName = json['merchant_name'],
        merchantCode = json['merchant_code'] ?? '';

  @override
  String toString() {
    return '{message: $message, success:$success, deviceId:$deviceId, terminalId:$terminalId merchantName:$merchantName, merchantCode:$merchantCode}';
  }
}
