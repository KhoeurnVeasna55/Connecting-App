import 'package:connecting_app/controller/Language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'navigation/navigation_screen.dart';
import 'theme/theme_app.dart';
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeAppMode.getTheme(languageController.locale.value, false),
        darkTheme: ThemeAppMode.getTheme(languageController.locale.value, true),
        themeMode: ThemeMode.system, 
        locale: languageController.locale.value,
        supportedLocales: const [Locale('km'), Locale('en')],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: NavigationScreen(),
      );
    });
  }
}

