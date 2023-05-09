class PendingTransactionEntry {
  final int amount;
  final int txType;
  final dynamic meta;
  final String reference;
  final String sessionId;
  final String merchantName;

  PendingTransactionEntry({
    required this.meta,
    required this.txType,
    required this.amount,
    required this.sessionId,
    required this.reference,
    required this.merchantName,
  });

  static PendingTransactionEntry fromJson(dynamic data) {
    return PendingTransactionEntry(
      meta: data['meta'] ?? {},
      reference: data['ref_id'],
      sessionId: data['session_id'],
      amount: data['amount'].toInt(),
      txType: data['meta']['tx_type'] ?? 0,
      merchantName: data['meta']['merchant_name'] ?? 'WIZZITPay',
    );
  }

  String get collectionAmount => meta['collectionAmount'] ?? '';
  String get contractNumber => meta['contractNumber'] ?? '';
  bool get isDebiCheck => txType == 8;
}
