import 'dart:developer';

import 'package:connecting_app/routes/app_route.dart';
import 'package:connecting_app/services/localstorange_service.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isRememberMe = false.obs;

  final SupabaseClient _supabase = Supabase.instance.client;
  Future<void> checkSession() async {
    final session = Supabase.instance.client.auth.currentSession;

    if (session != null && session.expiresAt != null) {
      final expiresAt = DateTime.fromMillisecondsSinceEpoch(
        session.expiresAt! * 1000,
      );
      final now = DateTime.now();

      log('Token expires at: $expiresAt, now is: $now');

      if (now.isBefore(expiresAt)) {
        log('Token still valid. Navigating to MainScreen');
        Get.offAllNamed(AppRoute.mainSereen);
        return;
      }
    }

    final res = await Supabase.instance.client.auth.refreshSession();

    if (res.session != null && res.user != null) {
      log(' Session refreshed successfully.');
      Get.offAllNamed(AppRoute.mainSereen);
    } else {
      log(' No valid session. Redirecting to login.');
      Get.offAllNamed(AppRoute.loginScreen);
    }
  }

  Future<bool> isLogin(String email, String password) async {
    try {
      isLoading.value = true;

      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        await LocalStorageService.instance.setString(
          'user_id',
          response.user!.id,
        );

        final session = response.session;
        if (session != null) {
          await LocalStorageService.instance.setString(
            'access_token',
            session.accessToken,
          );
          await LocalStorageService.instance.setString(
            'refresh_token',
            session.refreshToken!,
          );
        }
        await rememberMe(email, password);

        Get.offAllNamed(AppRoute.mainSereen);
        return true;
      }
    } on AuthException catch (e) {
      log('AuthException: ${e.message}');
      Get.snackbar("Login Error", e.message);
    } catch (e) {
      log('Unexpected login error: $e');
    } finally {
      isLoading.value = false;
    }

    return false;
  }

  Future<void> rememberMe(String email, String password) async {
    if (isRememberMe.value) {
      await LocalStorageService.instance.setString('remember_email', email);
      await LocalStorageService.instance.setString(
        'remember_password',
        password,
      );
      await LocalStorageService.instance.setBool('remember_me', true);
    } else {
      await LocalStorageService.instance.remove('remember_email');
      await LocalStorageService.instance.remove('remember_password');
      await LocalStorageService.instance.setBool('remember_me', false);
    }
  }

  Future<Map<String, String?>> loadRememberedCredentials() async {
    final rememberMe = LocalStorageService.instance.getBool('remember_me');
    final email = LocalStorageService.instance.getString('remember_email');
    final password = LocalStorageService.instance.getString(
      'remember_password',
    );
    isRememberMe.value = rememberMe ?? false;

    return {'email': email, 'password': password};
  }

  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    isLoading.value = true;

    try {
      final AuthResponse response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'username': username},
      );

      if (response.user != null) {
        await LocalStorageService.instance.setString(
          'user_id',
          response.user!.id,
        );

        final session = response.session;
        if (session != null) {
          await LocalStorageService.instance.setString(
            'access_token',
            session.accessToken,
          );
          await LocalStorageService.instance.setString(
            'refresh_token',
            session.refreshToken!,
          );
        }

        Get.offAllNamed(AppRoute.mainSereen);
      } else {
        Get.snackbar("Registration Error", "Unable to register user.");
        Get.offAllNamed(AppRoute.loginScreen);
      }
    } on AuthException catch (e) {
      log('Registration error: ${e.message}');
      Get.snackbar("Auth Error", e.message);
    } catch (e) {
      log('Unexpected registration error: $e');
      Get.snackbar("Error", "Something went wrong.");
    } finally {
      isLoading.value = false;
    }
  }
}
