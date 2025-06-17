import 'package:connecting_app/navigation/navigation_screen.dart';
import 'package:connecting_app/screen/auth_screen/login_screen.dart';
import 'package:connecting_app/screen/auth_screen/register_screen.dart';


import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoute {
  static const mainSereen = '/mainSereen';
  static const loginScreen = '/loginScreen';
  static const registerSceen = '/registerScreen';

  static final page = [
    GetPage(name: mainSereen, page: () => NavigationScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: registerSceen, page: () => RegisterScreen()),
  ];
} 