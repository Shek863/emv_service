// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      json['emv_meta_data'] as Map<String, dynamic>,
      json['fee'] as int? ?? 0,
      DateTime.parse(json['expire'] as String),
      json['amount'] as int,
      json['msisdn_to'] as String,
      json['purchase'] as bool? ?? true,
      json['ref_id'] as String,
      json['merchant_id'] as String,
      json['firebase_id'] as String?,
      json['tx_result'] as Map<String, dynamic>? ?? {},
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'amount': instance.amount,
      'fee': instance.fee,
      'expire': instance.expire.toIso8601String(),
      'emv_meta_data': instance.meta,
      'msisdn_to': instance.msisdn,
      'ref_id': instance.reference,
      'merchant_id': instance.merchantId,
      'firebase_id': instance.firebaseId,
      'purchase': instance.purchase,
      'tx_result': instance.transactionResults,
    };
