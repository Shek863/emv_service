const String prodKey = '0997F88E2F6771DB';
const String stagingKey = '66E7EDD61C4137F0';
const String prodUrl = 'akennfc.wizzitdigital.com';
const String stagingUrl = 'akennfc.staging.wizzitdigital.com';
const String prodMerchantId = '7ae31e80-5fbb-11eb-8397-dd3e88534dcc';
const String stagingMerchantId = '762e55e0-a29f-11eb-bf92-653a08269d89';

const String channelName = 'Mevo Online';
const channelDescription = 'Mevo Online';
const channelId = 'high_importance_channel';

class Config {
  final String url;
  final String otpUrl;
  final String merchantId;
  final String merchantCode;
  final String bankTerminalId;

  const Config({
    required this.url,
    required this.merchantId,
    required this.merchantCode,
    this.bankTerminalId = '000000000167510',
    this.otpUrl = 'wa-mevo.wizzitdigital.com',
  });

  static Config fromEnv({
    bool prod = false,
    bool mockSession = false,
  }) {
    return Config(
      url: prod ? prodUrl : stagingUrl,
      merchantCode: prod ? prodKey : stagingKey,
      merchantId: prod ? prodMerchantId : stagingMerchantId,
    );
  }

  static Config fromConfig({
    bool prod = false,
    required String merchantId,
    required String merchantCode,
  }) {
    return Config(
      merchantId: merchantId,
      merchantCode: merchantCode,
      url: prod ? prodUrl : stagingUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'otpUrl': otpUrl,
      'merchantId': merchantId,
      'merchantCode': merchantCode,
      'bankTerminalId': bankTerminalId,
    };
  }
}
