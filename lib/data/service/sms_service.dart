import 'package:sms/sms.dart';

class SmsService {
  SmsQuery query = SmsQuery();

  Future<List<SmsMessage>> getSMS({int? count = 10}) async {
    return await query.querySms(
      kinds: [
        SmsQueryKind.Inbox,
        SmsQueryKind.Sent,
        SmsQueryKind.Draft,
      ],
      count: count,
    );
  }
}
