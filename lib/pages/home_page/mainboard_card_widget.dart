import 'package:absensi_online/services/absen_services.dart';
import 'package:absensi_online/utils/constant.dart';
import 'package:absensi_online/widgets/custom_button.dart';
import 'package:absensi_online/widgets/custom_notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainboardCard extends StatelessWidget {
  String email = "Tidak terdaftar!";
  MainboardCard({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection("absen").doc(email).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: CircularProgressIndicator());
        }
        final status = snapshot.data!['status'];
        return Column(
          children: [
            Text(
              "Live Attendance",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            Text(
              DateFormat("Hms").format(DateTime.now()),
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff426689)),
            ),
            StreamBuilder(
              stream: Stream.periodic(Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Text(
                  DateFormat("EEEE, d MMMM y").format(DateTime.now()),
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff5D5D5D)),
                );
              },
            ),
            const Divider(),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Office Hours",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5D5D5D)),
            ),
            const Text(
              "08:00 - 17:00",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3 + 10,
                  child: CustomButton1(
                      btnName: "Check In",
                      btnColor: status == "checkIn" ? Colors.grey : colorBlue,
                      onPress: () {
                        if (status == "checkOut") {
                          customNotification(context,
                              message: "Sukses Check In", isSuccess: true);
                          AbsenServices().checkInToFirestore(
                              email: firebaseAuth.currentUser!.email!);
                        } else {
                          customNotification(context,
                              message: "check in error!", isError: true);
                        }
                      }),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 3 + 10,
                    child: CustomButton1(
                        btnName: "Check Out",
                        btnColor:
                            status == "checkOut" ? Colors.grey : colorBlue,
                        onPress: () {
                          if (status == "checkIn") {
                            customNotification(context,
                                message: "Sukses Check Out", isSuccess: true);
                            AbsenServices().checkOutToFirestore(
                                email: firebaseAuth.currentUser!.email!);
                          } else {
                            customNotification(context,
                                message: "check out error!", isError: true);
                          }
                        })),
              ],
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
