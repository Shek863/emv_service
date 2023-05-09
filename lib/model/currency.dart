class Currency {
  final int code;
  final int radix;
  final String display;

  const Currency({
    this.radix = 2,
    required this.code,
    required this.display,
  });

  static const Currency rand = Currency(code: 710, display: 'ZAR');
  static const Currency usd = Currency(code: 840, display: 'USD');

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'radix': radix,
      'display': display,
    };
  }
}
