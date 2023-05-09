import './registration_status.dart';

class AdapterStatus {
  String? message;
  final bool success;
  final bool complete;
  RegistrationStatus? registration;

  AdapterStatus({
    this.message,
    this.registration,
    required this.complete,
    required this.success,
  });

  bool get isRegistered {
    return registration != null && registration!.success;
  }

  AdapterStatus.fromJson(Map<String, dynamic> json)
      : complete = json['complete'],
        success = json['success'],
        message = json['message'];

  @override
  String toString() {
    return '{message: $message, success:$success, complete:$complete, registration:${registration!.toString()}}';
  }
}
