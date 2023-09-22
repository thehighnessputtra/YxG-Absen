// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:absensi_online/services/firebase_services.dart';
import 'package:absensi_online/utils/constant.dart';
import 'package:absensi_online/widgets/custom_button.dart';
import 'package:absensi_online/widgets/custom_notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustomButton1(
                  btnName: "ERROR",
                  onPress: () {
                    customNotification(context,
                        isError: true, message: "Message");
                  }),
              CustomButton1(
                  btnName: "TIDAK",
                  onPress: () {
                    customNotification(context, message: "Message");
                  }),
              CustomButton1(
                  btnName: "SUCCESS",
                  onPress: () {
                    customNotification(context,
                        isSuccess: true, message: "Message");
                  }),
              CustomButton1(
                  btnName: "Logout",
                  onPress: () {
                    FirebaseServices(FirebaseAuth.instance).signOut(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
