import 'package:intl/intl.dart';

class TransactionEntry {
  final int fee;
  final String pan;
  final int amount;
  final String code;
  final String rrn;
  final bool success;
  final String txLogType;
  final DateTime tranDate;
  final String terminalId;
  final String merchantName;
  final String merchantCode;
  final Map<String, dynamic> meta;

  TransactionEntry({
    this.fee = 0,
    required this.pan,
    required this.rrn,
    required this.code,
    this.meta = const {},
    required this.amount,
    required this.success,
    required this.tranDate,
    required this.txLogType,
    required this.terminalId,
    required this.merchantName,
    required this.merchantCode,
  });

  bool get isVoid => txLogType == 'void';

  int get _mLength => merchantCode.length;

  bool get isRefund => txLogType == 'refund';

  bool get isPayment => txLogType == 'payment';

  String get reference => rrn.isNotEmpty ? rrn : 'N/A';

  String get merchantLogoUrl => meta['merchant_logo_url'];

  String get panLastDigits => pan.substring(pan.length - 4);

  bool get hasLogoUrl => meta.containsKey('merchant_logo_url');

  String get merchantCodeLastDigits => merchantCode.substring(_mLength - 12);

  String get merchantDisplayName => meta['merchant_name'] ?? merchantName;

  static TransactionEntry fromJson(dynamic data) {
    return TransactionEntry(
      rrn: data['rrn'],
      pan: data['pan'],
      meta: data['meta'] ?? {},
      txLogType: data['tx_log_type'],
      amount: data['amount'].toInt(),
      code: data['result_code'] ?? '--',
      success: data['result_code'] == '00',
      merchantName: data['merchant_name'],
      terminalId: data['bank_terminal_id'],
      merchantCode: data['merchant_id'] ?? '--',
      tranDate: DateFormat('dd/MM/yyyy HH:mm').parse(data['tx_date_time']),
    );
  }
}
