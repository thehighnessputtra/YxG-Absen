import 'package:absensi_online/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TopBarCard extends StatelessWidget {
  String nama = "...";
  String bidang = "...";

  TopBarCard({required this.nama, required this.bidang, super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    return Row(
      children: [
        const SizedBox(
          width: 45,
          height: 45,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://simplan.sukoharjokab.go.id/images/Admin/photo.jpg"),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nama,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
            Text(bidang,
                style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xffF4F4F4),
                    fontWeight: FontWeight.w400)),
            Text(firebaseAuth.currentUser!.email!,
                style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xffF4F4F4),
                    fontWeight: FontWeight.w400)),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              FirebaseServices(firebaseAuth).signOut(context);
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ))
      ],
    );
  }
}
