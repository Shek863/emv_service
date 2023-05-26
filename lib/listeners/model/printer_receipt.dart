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
}
