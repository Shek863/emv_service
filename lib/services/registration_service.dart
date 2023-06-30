import 'dart:convert';
import 'model/config.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../services/session_service.dart';

class RegistrationService {
  final Config config;
  late SessionService service;

  RegistrationService(
    this.config,
  ) {
    service = SessionService(config);
  }

  String get auth {
    return base64Encode(
        utf8.encode('${config.merchantId}:${config.merchantCode}'));
  }

  Future<Response> initRegistration({
    required String msisdn,
    required String lastName,
    required String firstName,
    required String merchantName,
  }) async {
    var response = await http.post(
      Uri.https(config.url, '/api/v1/terminal/insert'),
      body: jsonEncode({
        'msisdn': msisdn,
        'merchant_id': config.merchantId,
      }),
      headers: {
        'Authorization': 'Basic $auth',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<Response> dispatchOTP({
    required String otp,
    required String msisdn,
    required String lastName,
    required String firstName,
    required String merchantName,
  }) async {
    return await http.post(
      Uri.https(config.otpUrl, '/api/v1/otp'),
      body: jsonEncode({
        'otp': otp,
        'msisdn': msisdn,
        'lastName': lastName,
        'firstName': firstName,
        'merchantName': merchantName,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Response?> completeRegistration({
    required String otp,
    required String msisdn,
    required String firebaseId,
    required String lastName,
    required String firstName,
    required String deviceId,
  }) async {
    var response = await http.post(
      Uri.https(config.url, '/api/v1/mevo/terminal/register_terminal'),
      body: jsonEncode({
        'otp': otp,
        'surname': lastName,
        'mobile_number': msisdn,
        'first_name': firstName,
        'firebase_id': firebaseId,
        'mobile_device_id': deviceId,
      }),
      headers: {
        'Authorization': 'Basic $auth',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
