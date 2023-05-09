class CardStatus {
  String status;

  CardStatus.fromJson(Map<String, dynamic> json) : status = json['message'];
}
