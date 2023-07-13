import 'dart:convert';
import 'currency.dart';

class EMVPaymentRequest {
  final int amount;
  final String meta;
  final String msisdn;
  final String sessionId;
  final String reference;
  final String profileId;
  final Currency currency;
  final String merchantToken;
  final String transactionType;
  final dynamic action;

  EMVPaymentRequest({
    required this.meta,
    this.sessionId = '',
    this.profileId = '',
    required this.msisdn,
    required this.amount,
    required this.reference,
    required this.merchantToken,
    this.currency = Currency.rand,
    this.transactionType = TransactionTypes.payment,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'msisdn': msisdn,
      'meta': metaString(),
      'reference': reference,
      'currency': currency.code,
      'merchantToken': merchantToken,
      'transactionType': transactionType,
    };
  }

  String metaString() {
    var metaData = jsonDecode(meta);
    metaData['profile_id'] = profileId;
    metaData['original_session_id'] = sessionId;
    return jsonEncode(metaData);
  }
}

class TransactionTypes {
  static const String payment = '00';
  static const String receivePayment = '21';
  static const String balanceEnquiry = '31';
}
