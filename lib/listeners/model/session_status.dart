class SessionStatus {
  int? timeout;
  String? code;
  String status;
  bool? success;
  String? message;
  Map<String, dynamic>? responseData;

  SessionStatus({
    this.code,
    this.timeout,
    this.message,
    this.success,
    required this.status,
    this.responseData = const {},
  });

  SessionStatus.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        status = json['status'],
        timeout = json['timeout'],
        success = json['success'],
        message = json['message'],
        responseData = json['responseData'];

  @override
  String toString() {
    return '{status: $status, code:$code, timeout:$timeout, success:$success, reason:$message, data:$responseData}';
  }
}