import 'package:absensi_online/pages/signup_page/sign_up_page.dart';
import 'package:absensi_online/services/firebase_services.dart';
import 'package:absensi_online/utils/constant.dart';
import 'package:absensi_online/widgets/custom_button.dart';
import 'package:absensi_online/widgets/textformfield_widget.dart';
import 'package:absensi_online/widgets/transition_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerEmail = TextEditingController();
    TextEditingController _controllerPassword = TextEditingController();

    return Scaffold(
      backgroundColor: colorBlue,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.8,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/login.jpeg")),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(200, 80),
                          bottomRight: Radius.elliptical(200, 80))),
                  height: 200,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Login to your account",
                  style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            ListView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height: 350.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40.0,
                        ),
                        CustomTextFormField(
                          controller: _controllerEmail,
                          usingTittle: true,
                          tittle: "Email",
                        ),
                        CustomTextFormField(
                          controller: _controllerPassword,
                          usingTittle: true,
                          usingHideText: true,
                          tittle: "Password",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity(horizontal: -4),
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                Text("Remember me"),
                              ],
                            ),
                            Text("Forgot Password",
                                style: TextStyle(fontWeight: fw600)),
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: CustomButton1(
                                btnName: "Login",
                                onPress: () {
                                  FirebaseServices(FirebaseAuth.instance)
                                      .signInEmail(
                                          email: _controllerEmail.text,
                                          password: _controllerPassword.text,
                                          context: context);
                                })),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text.rich(TextSpan(
                          children: [
                            TextSpan(text: "Don't have account? "),
                            TextSpan(
                                text: "Sign Up",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    navPushTransition(
                                        context, const SignUpPage());
                                  },
                                style: TextStyle(fontWeight: fw600))
                          ],
                        )),
                        const SizedBox(
                          height: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                )),
          ],
        ),
      ),
    );
  }
}
