import 'package:absensi_online/pages/home_page/home_page.dart';
import 'package:absensi_online/pages/landing_page/landing_page.dart';
import 'package:absensi_online/services/sharedpreferences_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> route() async {
    final pref = SharedPreferenceServices();
    String? email = await pref.getEmail();
    Future.delayed(const Duration(seconds: 3), () {
      if (email != null) {
        // print(email);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LandingPage()),
        );
      }
    });
  }

  @override
  void initState() {
    route();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
