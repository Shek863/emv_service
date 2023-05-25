import '../services/model/config.dart';

class EMVConfig {
  int? signatureFlag;
  int? pinRequirement;
  double? readerLimit;
  String? countryCode;
  bool? enforcePINCVM;
  final Config config;
  String? mockAuthCode;
  int? currencyExponent;
  String? currencyCode;
  String? transactionType;
  bool? overrideProfileConfig;

  EMVConfig({
    required this.config,
    this.signatureFlag = 1,
    this.pinRequirement = 1,
    this.readerLimit = 0.50,
    this.mockAuthCode = '00',
    this.currencyExponent = 2,
    this.countryCode = '0710',
    this.enforcePINCVM = true,
    this.currencyCode = '0710',
    this.transactionType = '00',
    this.overrideProfileConfig = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'isAbsa': true,
      'config': config.toJson(),
      'readerLimit': readerLimit,
      'countryCode': countryCode,
      'currencyCode': currencyCode,
      'mockAuthCode': mockAuthCode,
      'signatureFlag': signatureFlag,
      'enforcePINCVM': enforcePINCVM,
      'pinRequirement': pinRequirement,
      'transactionType': transactionType,
      'currencyExponent': currencyExponent,
      'overrideProfileConfig': overrideProfileConfig,
    };
  }
}
