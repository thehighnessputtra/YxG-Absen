import 'package:absensi_online/services/absen_services.dart';
import 'package:absensi_online/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainboardCard extends StatelessWidget {
  const MainboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return Column(
      children: [
        const Text(
          "Live Atendance",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        Text(
          DateFormat("Hms").format(DateTime.now()),
          style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Color(0xff426689)),
        ),
        Text(
          DateFormat("EEEE, d MMMM y").format(DateTime.now()),
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff5D5D5D)),
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
                  onPress: () {
                    AbsenServices().checkInToFirestore(
                        email: firebaseAuth.currentUser!.email!);
                  }),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 3 + 10,
                child: CustomButton1(
                    btnName: "Check Out",
                    onPress: () {
                      AbsenServices().checkOutToFirestore(
                          email: firebaseAuth.currentUser!.email!);
                    })),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
