import 'package:absensi_online/pages/auth/login_page/login_page.dart';
import 'package:absensi_online/pages/auth/signup_page/sign_up_page.dart';
import 'package:absensi_online/utils/constant.dart';
import 'package:absensi_online/widgets/custom_button.dart';
import 'package:absensi_online/widgets/transition_widget.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 50),
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: colorDarkBlue,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.elliptical(
                                MediaQuery.of(context).size.width / 1.5,
                                MediaQuery.of(context).size.height / 3))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          height: 200.0,
                        ),
                        Text(
                          "Absensi System",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "YxG ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800)),
                          TextSpan(
                              text: "Absen",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400))
                        ])),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: CustomButton2(
                    btnName: "Login",
                    onPress: () {
                      navPushTransition(context, const LoginPage());
                    }),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: CustomButton1(
                    btnName: "Sign Up",
                    onPress: () {
                      navPushTransition(context, const SignUpPage());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
