import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  @JsonKey(name: 'amount')
  int amount;
  @JsonKey(name: 'fee', defaultValue: 0)
  int fee;
  @JsonKey(name: 'expire', disallowNullValue: false)
  DateTime expire;
  @JsonKey(name: 'emv_meta_data')
  Map<String, dynamic> meta;
  @JsonKey(name: 'msisdn_to', disallowNullValue: false)
  String msisdn;
  @JsonKey(name: 'ref_id', disallowNullValue: false)
  String reference;
  @JsonKey(name: 'merchant_id', disallowNullValue: false)
  String merchantId;
  @JsonKey(name: 'firebase_id', disallowNullValue: false)
  String? firebaseId;
  @JsonKey(name: 'purchase', disallowNullValue: false, defaultValue: true)
  bool? purchase;
  @JsonKey(name: 'tx_result', disallowNullValue: false, defaultValue: {})
  Map<String, dynamic> transactionResults;

  String get merchantLogoUrl => meta['merchant_logo_url'];

  bool get hasLogoUrl => meta.containsKey('merchant_logo_url');

  bool get isProcessed =>
      transactionResults.containsKey('completed') &&
      transactionResults['completed'] == true;

  bool get isRejected =>
      isProcessed &&
      transactionResults.containsKey('code') &&
      transactionResults['code'] == '17';

  int get maxAmount => meta['maxAmount'] ?? 0;

  String get contractNumber => meta['contractNumber'] ?? '';

  String get accountNumber => meta['accountNumber'] ?? '';

  String get rsaIdNumber => meta['rsaIdNumber'] ?? '';

  String get accountType => meta['accountType'] ?? '';

  String get idType => meta['idType'] ?? '';

  int get collectionAmount => meta['collectionAmount'] ?? 0;

  int get installmentAmount => meta['installmentAmount'] ?? 0;

  bool get isDebiCheck => meta['tx_type'] == 8;

  Payment(
    this.meta,
    this.fee,
    this.expire,
    this.amount,
    this.msisdn,
    this.purchase,
    this.reference,
    this.merchantId,
    this.firebaseId,
    this.transactionResults,
  );

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
