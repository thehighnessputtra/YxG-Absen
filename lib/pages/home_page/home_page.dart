// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:absensi_online/pages/home_page/attendance_history_widget.dart';
import 'package:absensi_online/widgets/background_widget.dart';
import 'package:absensi_online/pages/home_page/mainboard_card_widget.dart';
import 'package:absensi_online/pages/home_page/top_bar_widget.dart';
import 'package:absensi_online/services/absen_services.dart';
import 'package:absensi_online/services/firebase_services.dart';
import 'package:absensi_online/test.dart';
import 'package:absensi_online/utils/constant.dart';
import 'package:absensi_online/widgets/custom_button.dart';
import 'package:absensi_online/widgets/transition_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String nama = "...";
  String bidang = "...";
  Future getUsers() async {
    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.email!)
        .get()
        .then((value) {
      if (value.exists) {
        setState(() {
          nama = value.data()!['nama'];
          bidang = value.data()!['bidang'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  const MyBackgroundWidget(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopBarCard(
                          nama: nama,
                          bidang: bidang,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(20),
                            height: 250,
                            width: double.infinity,
                            child: MainboardCard()),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: const [
                            Icon(Icons.history_outlined),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Attendance History",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        StreamBuilder(
                          stream:
                              firebaseFirestore.collection('absen').snapshots(),
                          builder: (context, snapshot) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final items = snapshot.data!.docs[index];
                                String absenEmail = items["email"];
                                Map<String, dynamic> checkIn = items["checkIn"];
                                Map<String, dynamic> checkOut =
                                    items["checkOut"];
                                // checkIn
                                List<Timestamp> dateCheckInList =
                                    List<Timestamp>.from(
                                        checkIn["dateCheckIn"]);
                                List<String> latCheckInList =
                                    List<String>.from(checkIn["lat"]);
                                List<String> longCheckInList =
                                    List<String>.from(checkIn["long"]);

                                // checkOut
                                List<Timestamp> dateCheckOutList =
                                    List<Timestamp>.from(
                                        checkOut["dateCheckOut"]);
                                List<String> latCheckOutList =
                                    List<String>.from(checkOut["lat"]);
                                List<String> longCheckOutList =
                                    List<String>.from(checkOut["long"]);

                                int maxLength = dateCheckInList.length;
                                if (dateCheckOutList.length < maxLength) {
                                  maxLength = dateCheckOutList.length;
                                }
                                return
                                    // Text(absenEmail);
                                    AttendanceHistory(
                                        email: absenEmail,
                                        dateCheckInList: dateCheckInList,
                                        dateCheckOutList: dateCheckOutList);
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
