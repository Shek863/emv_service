import 'locale_message.dart';

class LocaleMessages {
  final LocaleMessage time;
  final LocaleMessage tapCard;
  final LocaleMessage removeCard;
  final LocaleMessage sessionInit;
  final LocaleMessage sessionComplete;
  final LocaleMessage sessionProcession;

  const LocaleMessages({
    this.time = const LocaleMessage(
      title: 'Time',
      message: 'sec',
    ),
    this.removeCard = const LocaleMessage(
      title: 'Remove Card',
      message: 'You may remove your card',
    ),
    this.sessionProcession = const LocaleMessage(
      title: 'Processing Transaction',
      message: 'Please dont remove your card',
    ),
    this.sessionInit = const LocaleMessage(
      title: 'Initialising',
      message: 'Initialising backend communication',
    ),
    this.sessionComplete = const LocaleMessage(
      title: 'Processing Complete',
      message: 'Closing service communication channel',
    ),
    this.tapCard = const LocaleMessage(
      title: 'Tap Card',
      message: 'Tap your card on the back of the device',
    ),
  });
}
