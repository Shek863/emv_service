import 'dart:convert';
import 'model/config.dart';
import 'model/payment.dart';
import '../model/profile.dart';
import 'package:http/http.dart';
import '../model/payment_request.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class SessionService extends ChangeNotifier {
  final Config config;

  SessionService(this.config);

  Future<Response> createPaymentSession(
      EMVPaymentRequest payment, String deviceId) async {
    dynamic meta = jsonDecode(payment.meta);
    meta['deviceId'] = deviceId;
    meta['original_session_id'] = payment.sessionId;
    var response = await http.post(
      Uri.https(
        config.url,
        '/api/v1/session',
      ),
      body: jsonEncode({
        "meta": meta,
        "confirm": false,
        "cards_limit": 31,
        "operation": "pay",
        "isTrustedUser": true,
        "emv_meta_data": meta,
        'amount': payment.amount,
        'msisdn': payment.msisdn,
        "ref_id": payment.reference,
        "mobile_device_id": deviceId,
        "profile_id": payment.profileId,
        "callback_url": "payment_completed",
      }),
      headers: {
        'Authorization': 'Basic $auth2',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<Response> createTT3Session(
    EMVPaymentRequest payment,
    String deviceId,
  ) async {
    dynamic meta = jsonDecode(payment.meta);
    meta['deviceId'] = deviceId;
    meta['original_session_id'] = payment.sessionId;
    var response = await http.post(
      Uri.https(
        config.tt3Url,
        '/api/v1/session',
      ),
      body: jsonEncode({
        "contract": meta,
        "operation": "cnp_dc",
        'msisdn': payment.msisdn,
        "ref_id": payment.reference,
        "mobile_device_id": deviceId,
        "profile_id": payment.profileId,
        "callback_url": "payment_completed",
        "wamsisdn": meta['wamsisdn'] ?? payment.msisdn,
      }),
      headers: {
        'Authorization': 'Basic $auth2',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<Response> paymentSession(String sessionId, bool receipt) async {
    var response = await http.post(
      Uri.https(
        config.url,
        '/api/v1/cp_session',
      ),
      body: jsonEncode({
        'receipt': receipt,
        'session_id': sessionId,
      }),
      headers: {
        'Authorization': 'Basic $auth',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  String get auth {
    return base64Encode(
      utf8.encode('system:dGhpcyBjb2RlIGlzIHNvIGJlYXV0aWZ1bCEK'),
    );
  }

  String get auth2 {
    return base64Encode(
      utf8.encode('${config.merchantId}:${config.merchantCode}'),
    );
  }

  Future<Response> transactionHistory({required String deviceId}) async {
    var response = await http.post(
      Uri.https(config.url, '/api/v1/reports/tx_log'),
      body: jsonEncode({
        "filter": {
          "pan_format": 'pan_id_only',
          "mobile_device_id": deviceId,
        },
        "sort": {
          "tx_date_time": 0,
        },
        "row_mode": "object",
        "time_zone": "Africa/Johannesburg"
      }),
      headers: {
        'Authorization': 'Basic $auth2',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<Response?> validateMobileNumber(String mobileNumber) async {
    var response = await http.post(
      Uri.https(
        config.url,
        '/api/v1/check/firebase_id',
      ),
      body: jsonEncode({
        'msisdn': mobileNumber,
      }),
      headers: {
        'Authorization': 'Basic $auth',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<Response> sendFirebasePayment(Payment payment) async {
    var response = await http.post(
      Uri.https(
        config.url,
        '/api/v1/mevo_payment_init',
      ),
      body: jsonEncode({
        'amount': payment.amount,
        'reference': payment.reference,
        'mobile_number': payment.msisdn,
      }),
      headers: {
        'Authorization': 'Basic $auth2',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<Response> updateFirebaseId(String token, String deviceId) async {
    var response = await http.post(
      Uri.https(
        config.url,
        '/api/v1/mevo/update_firebase',
      ),
      body: jsonEncode({
        'deviceid': deviceId,
        'firebase_id': token,
      }),
      headers: {
        'Authorization': 'Basic $auth',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<Response> profileTransactionsHistory(Profile profile) async {
    var response = await http.post(
      Uri.https(config.url, '/api/v1/reports/tx_log'),
      body: jsonEncode({
        "filter": {
          "pan_format": 'pan_id_only',
          "profile_id": profile.uuid,
        },
        "sort": {
          "tx_date_time": 0,
        },
        "row_mode": "object",
        "time_zone": "Africa/Johannesburg"
      }),
      headers: {
        'Authorization': 'Basic $auth2',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<Response> profilePendingTransactions(Profile profile) async {
    var response = await http.post(
      Uri.https(config.url, '/api/v1/reports/pending_tx_log'),
      body: jsonEncode({
        "profile_id": profile.uuid,
      }),
      headers: {
        'Authorization': 'Basic $auth2',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<Response> rejectPaymentRequest(String sessionId) async {
    var response = await http.post(
      Uri.https(config.url, '/api/v1/delete_pending_tx'),
      body: jsonEncode({
        "session_id": sessionId,
      }),
      headers: {
        'Authorization': 'Basic $auth2',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
