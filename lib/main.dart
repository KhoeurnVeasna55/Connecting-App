import 'package:connecting_app/controller/quesiton_controller.dart';
import 'package:connecting_app/services/localstorange_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'myapp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  final url = dotenv.env['URL'];
  final anonKey = dotenv.env['ANON_KEY'];
  await Supabase.initialize(url: url!, anonKey: anonKey!);
  Get.put(QuestionController());
  await LocalStorageService.instance.init();
  runApp(MyApp());
}
