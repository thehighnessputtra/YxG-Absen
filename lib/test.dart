import 'package:absensi_online/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  String statusAbsen = "belumAbsen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton1(
                btnName: "Check in",
                onPress: () {
                  if (statusAbsen == "belumAbsen") {
                    print("berhasil checkin");
                    setState(() {
                      statusAbsen = "sudahAbsen";
                    });
                  } else {
                    print("sudah absen cok");
                  }
                }),
            CustomButton1(
                btnName: "Check out",
                onPress: () {
                  if (statusAbsen == "sudahAbsen") {
                    print("berhasil checkout");
                    setState(() {
                      statusAbsen = "belumAbsen";
                    });
                  } else {
                    print("belum absen cok");
                  }
                })
          ],
        ),
      ),
    );
  }
}
