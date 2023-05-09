import 'model/adapter_status.dart';
import 'model/registration_status.dart';

typedef Web3DesListener = void Function();
typedef AdapterListener = void Function(AdapterStatus status);
typedef RegistrationListener = void Function(RegistrationStatus status);
