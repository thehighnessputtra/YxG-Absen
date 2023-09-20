import 'package:absensi_online/pages/signup_page/sign_up_page.dart';
import 'package:absensi_online/utils/constant.dart';
import 'package:absensi_online/widgets/custom_button.dart';
import 'package:absensi_online/widgets/textformfield_widget.dart';
import 'package:absensi_online/widgets/transition_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlue,
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(200, 80),
                      bottomRight: Radius.elliptical(200, 80))),
              height: 200,
            ),
            ListView(
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
                          usingTittle: true,
                          tittle: "Username",
                        ),
                        CustomTextFormField(
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
                                btnName: "Login", onPress: () {})),
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
          ],
        ),
      ),
    );
  }
}
