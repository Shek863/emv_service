import 'dart:convert';
import 'model/config.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../services/session_service.dart';

class ProfileService {
  final Config config;
  late SessionService service;

  ProfileService(
    this.config,
  ) {
    service = SessionService(config);
  }

  Future<Response> checkProfileRegistration({
    required String deviceId,
  }) async {
    return await _processRequest(
      uri: '/api/v2/mevo/user_profile/check_registration',
      request: {
        'mobile_device_id': deviceId,
      },
    );
  }

  Future<Response> checkTerminalRegistration({
    required String deviceId,
  }) async {
    return await _processRequest(
      uri: '/api/v2/mevo/terminal/check_registration',
      request: {
        'mobile_device_id': deviceId,
      },
    );
  }

  Future<Response> registerProfile({
    String? email,
    required String msisdn,
    required String surname,
    required String deviceId,
    required String firstName,
    required String merchantId,
    required String firebaseId,
    required String terminalId,
  }) async {
    return await _processRequest(
      uri: '/api/v2/mevo/user_profile/register',
      request: {
        "msisdn": msisdn,
        "surname": surname,
        "email_address": email,
        "first_name": firstName,
        "firebase_id": firebaseId,
        "merchant_id": merchantId,
        "mobile_device_id": deviceId,
        "bank_terminal_id": terminalId,
      },
    );
  }

  Future<Response> registerTerminal({
    required String otp,
    required String deviceId,
  }) async {
    return await _processRequest(
      uri: '/api/v1/terminal/register_terminal',
      request: {
        "otp": otp,
        "device_id": deviceId,
      },
    );
  }

  Future<Response> updateProfile({
    String? email,
    required String surname,
    required String profileId,
    required String firstName,
  }) async {
    return await _processRequest(
      uri: '/api/v2/mevo/user_profile/update',
      request: {
        "surname": surname,
        "email_address": email,
        "first_name": firstName,
        "user_profile_id": profileId,
      },
    );
  }

  Future<Response> transferDevice({
    required String msisdn,
    required String deviceId,
    required String newMsisdn,
  }) async {
    return await _processRequest(
      uri: '/api/v2/mevo/terminal/transfer',
      request: {
        "old_msisdn": msisdn,
        "new_msisdn": newMsisdn,
        "old_mobile_device_id": deviceId,
      },
    );
  }

  Future<Response> unregisterProfile({
    required String profileId,
  }) async {
    return await _processRequest(
      uri: '/api/v2/mevo/user_profile/unregister',
      request: {
        "user_profile_id": profileId,
      },
    );
  }

  Future<Response> fetchProfile({
    required String profileId,
  }) async {
    return await _processRequest(
      uri: '/api/v2/mevo/user_profile/fetch',
      request: {
        "user_profile_id": profileId,
      },
    );
  }

  Future<Response> _processRequest({
    required String uri,
    dynamic request,
  }) async {
    var response = await http.post(
      Uri.https(config.url, uri),
      body: jsonEncode(request),
      headers: {
        'Authorization': 'Basic $_auth',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  String get _auth {
    return base64Encode(
      utf8.encode('${config.merchantId}:${config.merchantCode}'),
    );
  }
}
