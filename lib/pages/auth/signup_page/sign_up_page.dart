// import 'package:flutter/material.dart';

// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Sign Up")),
//       body: Text("SignUpPage"),
//     );
//   }
// }

import 'package:absensi_online/services/firebase_services.dart';
import 'package:absensi_online/utils/constant.dart';
import 'package:absensi_online/widgets/custom_button.dart';
import 'package:absensi_online/widgets/custom_dialog.dart';
import 'package:absensi_online/widgets/custom_notification.dart';
import 'package:absensi_online/widgets/textformfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _controllerNoID = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  String bidang = "bidang";
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBlue,
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text("Sorry ",
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.w800,
                  //         fontSize: 35)),
                  // Text(
                  //   "under maintenance!",
                  //   style: TextStyle(
                  //       color: Colors.amber,
                  //       fontWeight: FontWeight.w500,
                  //       fontSize: 30),
                  // ),
                  CustomTextFormField(
                    controller: _controllerNoID,
                    usingTittle: true,
                    tittle: "No. ID",
                  ),
                  CustomTextFormField(
                    controller: _controllerEmail,
                    usingTittle: true,
                    tittle: "Email",
                  ),
                  CustomTextFormField(
                    controller: _controllerNama,
                    usingTittle: true,
                    tittle: "Nama",
                  ),
                  CustomTextFormField(
                    controller: _controllerPassword,
                    usingTittle: true,
                    usingHideText: true,
                    tittle: "Password",
                  ),
                  CustomButton2(
                      btnName: "Sign Up",
                      onPress: () {
                        if (RegExp(r'^001\d{4}')
                            .hasMatch(_controllerNoID.text)) {
                          setState(() {
                            bidang = "Pemrograman";
                          });
                        } else if (RegExp(r'^002\d{4}')
                            .hasMatch(_controllerNoID.text)) {
                          setState(() {
                            bidang = "UI/UX";
                          });
                        } else {
                          setState(() {
                            bidang = "-";
                          });
                        }
                        customDialog(context,
                            title: "Information",
                            confirmButton: true, yesPressed: () {
                          if (bidang == "-") {
                            customDialog(context,
                                title: "ERROR",
                                content: SingleChildScrollView(
                                  child: Center(
                                      child: Text("Pastikan No. ID Sesuai")),
                                ));
                          } else {
                            FirebaseServices(FirebaseAuth.instance).signUpEmail(
                                email: _controllerEmail.text,
                                password: _controllerPassword.text,
                                noid: _controllerNoID.text,
                                name: _controllerNama.text,
                                bidang: bidang,
                                context: context);
                          }
                        },
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("No. ID : ${_controllerNoID.text}"),
                                  Text("Email : ${_controllerEmail.text}"),
                                  Text("Nama : ${_controllerNama.text}"),
                                  Text("Bidang : $bidang"),
                                ],
                              ),
                            ));
                      })
                ],
              ),
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
        ));
  }
}
