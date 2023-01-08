import 'package:flutter/material.dart';
import 'package:mega_intern/locator_service.dart';

import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
