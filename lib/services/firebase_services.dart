import 'package:absensi_online/pages/auth/login_page/login_page.dart';
import 'package:absensi_online/pages/home_page/home_page.dart';
import 'package:absensi_online/services/sharedpreferences_services.dart';
import 'package:absensi_online/widgets/custom_notification.dart';
import 'package:absensi_online/widgets/transition_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  final FirebaseAuth auth;
  final SharedPreferenceServices sharedPref = SharedPreferenceServices();

  FirebaseServices(this.auth);

  authRoute(context, {required String message, required Widget page}) {
    customNotification(
      context,
      message: message,
      isSuccess: true,
      icon: Icons.notifications_active,
    );
    Future.delayed(
      const Duration(milliseconds: 500),
      () => navReplaceTransition(context, page),
    );
  }

  Future<void> signInEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      sharedPref.saveEmail(email);
      // ignore: use_build_context_synchronously
      authRoute(
        context,
        message: "Login berhasil!",
        page: HomePage(),
      );
    } on FirebaseAuthException catch (e) {
      print("MESSAGE = ${e.message}");
      if (e.message ==
          "The password is invalid or the user does not have a password.") {
        return customNotification(
          context,
          isError: true,
          message: 'Password salah!',
          tittle: "ERROR",
        );
      } else if (e.message ==
          "We have blocked all requests from this device due to unusual activity .Try again later.") {
        return customNotification(context,
            message: 'Terlalu banyak percobaan. Silahkan coba lagi nanti!',
            tittle: "ERROR",
            isError: true);
      } else {
        return customNotification(context,
            message: 'Proses login error. Silahkan coba lagi nanti!!',
            tittle: "ERROR!",
            isError: true);
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await auth.signOut();
      sharedPref.deleteEmail();
      // ignore: use_build_context_synchronously
      authRoute(context, message: "Logout success!", page: const LoginPage());
    } on FirebaseAuthException catch (e) {
      return customNotification(
          message: "Proses logout error!", isError: true, context);
    }
  }
}
