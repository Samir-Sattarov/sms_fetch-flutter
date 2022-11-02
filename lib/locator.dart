import 'package:get_it/get_it.dart';

import 'data/service/sms_service.dart';

final locator = GetIt.I;

void setup() {
  locator.registerSingleton<SmsService>(SmsService());
}
