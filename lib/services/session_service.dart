import 'dart:convert';
import 'model/config.dart';
import 'model/payment.dart';
import '../model/profile.dart';
import 'model/transaction_entry.dart';
import '../model/payment_request.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'model/pending_transaction_entry.dart';
import '../listeners/model/registration_status.dart';

typedef SessionRegistrationListener = void Function(
    RegistrationStatus response);

class SessionService extends ChangeNotifier {
  final Config config;

  SessionService(this.config);

  Future<RegistrationStatus> getRegistration({required String deviceId}) async {
    var response = await http.post(
      Uri.https(
        config.url,
        '/api/v1/mevo/check_registration',
      ),
      body: jsonEncode({
        'device_id': deviceId,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['is_registered'] == true) {
        data['deviceId'] = deviceId;
        return RegistrationStatus.fromJson(data);
      }
    }
    return RegistrationStatus.fromJson({
      "is_registered": false,
      "deviceId": deviceId,
    });
  }

  void doCheckRegistration(SessionRegistrationListener listener,
      {required String deviceId}) async {
    listener(await getRegistration(deviceId: deviceId));
  }

  Future<Uri?> createPaymentSession(
      EMVPaymentRequest payment, String deviceId, dynamic action) async {
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
    if (response.statusCode == 200) {
      var url = jsonDecode(response.body);
      if (url['url'] != null) {
        return Uri.parse(url['url']);
      }
    }
    return null;
  }

  Future<Uri?> createTT3Session(
    EMVPaymentRequest payment,
    String deviceId,
  ) async {
    dynamic meta = jsonDecode(payment.meta);
    meta['deviceId'] = deviceId;
    meta['original_session_id'] = payment.sessionId;
    var response = await http.post(
      Uri.https(
        config.url,
        '/api/v1/session',
      ),
      body: jsonEncode({
        "operation": "cnp_dc",
        'msisdn': payment.msisdn,
        "ref_id": payment.reference,
        "wamsisdn": meta['wamsisdn'],
        "callback_url": "payment_completed",
        "contract": meta,
        "mobile_device_id": deviceId,
        "profile_id": payment.profileId,
      }),
      headers: {
        'Authorization': 'Basic $auth2',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var url = jsonDecode(response.body);
      if (url['url'] != null) {
        return Uri.parse(url['url']);
      }
    }
    return null;
  }

  Future<Payment?> paymentSession(String sessionId) async {
    var response = await http.post(
      Uri.https(
        config.url,
        '/api/v1/cp_session',
      ),
      body: jsonEncode({
        'session_id': sessionId,
      }),
      headers: {
        'Authorization': 'Basic $auth',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == false) {
        var result = data['session_data'];
        result['expire'] = data['expiry_date'];
        return Payment.fromJson(result);
      }
    }
    return null;
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

  Future<List<TransactionEntry>> transactionHistory(
      {required String deviceId}) async {
    List<TransactionEntry> transactions = [];
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
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == false) {
        List<dynamic> entries = data['rows'];
        transactions =
            entries.map((e) => TransactionEntry.fromJson(e)).toList();
      }
    }
    return transactions;
  }

  Future<String?> validateMobileNumber(String mobileNumber) async {
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
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == false) {
        return data['firebase_id'];
      }
    }
    return null;
  }

  Future<bool> sendFirebasePayment(Payment payment) async {
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
    return (response.statusCode == 200);
  }

  Future<bool> updateFirebaseId(String token, String deviceId) async {
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
    return response.statusCode == 200;
  }

  Future<List<TransactionEntry>> profileTransactionsHistory(
      Profile profile) async {
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
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == false) {
        List<dynamic> entries = data['rows'];
        try {
          return entries
              .where((e) => isValid(e))
              .map((e) => TransactionEntry.fromJson(e))
              .toList();
        } catch (e) {
          return [];
        }
      }
    }
    return [];
  }

  bool isValid(dynamic data) {
    try {
      TransactionEntry.fromJson(data);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<List<PendingTransactionEntry>> profilePendingTransactions(
      Profile profile) async {
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

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['error'] == false) {
        List<dynamic> entries = data['rows'];
        try {
          return entries
              .map((e) => PendingTransactionEntry.fromJson(e))
              .toList();
        } catch (error) {
          return [];
        }
      }
    }
    return [];
  }

  Future<bool> rejectPaymentRequest(String sessionId) async {
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
    return response.statusCode == 200;
  }

  /// Place-holder fo profile de-registration
  Future<bool> deregisterProfile(String profileId) async {
    var response = await http.post(
      Uri.https(config.url, '/api/v1/delete_profile'),
      body: jsonEncode({
        "profile_id": profileId,
      }),
      headers: {
        'Authorization': 'Basic $auth2',
        'Content-Type': 'application/json',
      },
    );
    return response.statusCode == 200;
  }
}
