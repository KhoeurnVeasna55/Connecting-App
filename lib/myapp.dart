import 'package:connecting_app/binding/binding.dart';
import 'package:connecting_app/controller/Language_controller.dart';
import 'package:connecting_app/l10n/app_localizations.dart';
import 'package:connecting_app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'l10n/l10n.dart';
import 'theme/theme_app.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        title: 'Connecting Appp',
        debugShowCheckedModeBanner: false,
        theme: ThemeAppMode.getTheme(languageController.locale.value, false),
        darkTheme: ThemeAppMode.getTheme(languageController.locale.value, true),
        themeMode: ThemeMode.system,
        locale: languageController.locale.value,
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialBinding: Binding(),
        initialRoute: AppRoute.loginScreen,
        getPages: AppRoute.page,
      );
    });
  }
}
