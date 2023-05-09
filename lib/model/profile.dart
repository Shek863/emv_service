import '../listeners/model/registration_status.dart';

class Profile {
  final String uuid;
  final String lastName;
  final String firstName;
  final String deviceId;
  final String merchantId;
  final String mobileNumber;
  final String merchantCode;
  final String merchantName;

  const Profile({
    this.uuid = '',
    this.lastName = '',
    this.deviceId = '',
    this.firstName = '',
    this.merchantId = '',
    this.mobileNumber = '',
    this.merchantCode = '',
    this.merchantName = '',
  });

  static Profile fromRegistration(RegistrationStatus response) {
    return Profile(
      uuid: response.uuid!,
      lastName: response.lastName!,
      deviceId: response.deviceId!,
      firstName: response.firstName!,
      merchantId: response.merchantId!,
      mobileNumber: response.mobileNumber!,
      merchantCode: response.merchantCode!,
      merchantName: response.merchantName!,
    );
  }
}
