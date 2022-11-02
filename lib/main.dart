import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'internal/application.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.sms.request();
  setup();
  runApp(const Application());
}
