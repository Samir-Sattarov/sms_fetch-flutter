import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sms/sms.dart';

import '../../../data/service/sms_service.dart';
import '../../../locator.dart';

part 'sms_state.dart';

class SmsCubit extends Cubit<List<SmsMessage>> {
  final smsService = locator<SmsService>();
  SmsCubit() : super([]);

  void getAllSMS() async {
    List<SmsMessage> messages = [];

    messages = await smsService.getSMS();

    emit(messages);
  }
}
