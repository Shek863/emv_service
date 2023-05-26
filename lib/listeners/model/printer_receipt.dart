class PrinterReceipt {
  String? fee;
  String? time;
  String? date;
  String? total;
  String? amount;
  bool? approved;
  bool? showBarCode;
  String? base64Logo;
  String? textDetail;
  String? merchantName;

  PrinterReceipt({
    this.fee,
    this.date,
    this.time,
    this.total,
    this.amount,
    this.approved,
    this.base64Logo,
    this.textDetail,
    this.showBarCode,
    this.merchantName,
  });

  Map<String, dynamic> toJson() {
    return {
      'fee': fee,
      'date': date,
      'time': time,
      'total': total,
      'amount': amount,
      'approved': approved,
      'base64Logo': base64Logo,
      'showBarCode': showBarCode,
      'merchantName': merchantName,
    };
  }
}
