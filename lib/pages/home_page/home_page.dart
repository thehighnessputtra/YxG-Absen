// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:async';

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

  String nama = "...";
  String bidang = "...";
  Future getUsers() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email!)
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

  Future getAbsen() async {
    await FirebaseFirestore.instance
        .collection('absen')
        .doc(FirebaseAuth.instance.currentUser!.email!)
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
                  Container(
                    padding: const EdgeInsets.only(right: 50),
                    height: MediaQuery.of(context).size.height / 2 - 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: colorBlue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 50),
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: colorDarkBlue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.elliptical(300, 300),
                            bottomRight: Radius.elliptical(
                                MediaQuery.of(context).size.width * 2,
                                MediaQuery.of(context).size.height))),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 45,
                              height: 45,
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(nama,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                                Text(bidang,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xffF4F4F4),
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  FirebaseServices(FirebaseAuth.instance)
                                      .signOut(context);
                                },
                                icon: const Icon(
                                  Icons.exit_to_app,
                                  color: Colors.white,
                                ))
                          ],
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
                          child: StreamBuilder(
                            stream: Stream.periodic(const Duration(seconds: 1)),
                            builder: (context, snapshot) {
                              return Column(
                                children: [
                                  const Text(
                                    "Live Atendance",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    DateFormat("Hms").format(DateTime.now()),
                                    style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff426689)),
                                  ),
                                  Text(
                                    DateFormat("EEEE, d MMMM y")
                                        .format(DateTime.now()),
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
                                    "08:00 AM - 05:00 PM",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    3 +
                                                10,
                                        child: CustomButton1(
                                            btnName: "Check In",
                                            onPress: () {
                                              AbsenServices()
                                                  .checkInToFirestore(
                                                      email: FirebaseAuth
                                                          .instance
                                                          .currentUser!
                                                          .email!);
                                            }),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3 +
                                              10,
                                          child: CustomButton1(
                                              btnName: "Check Out",
                                              onPress: () {
                                                AbsenServices()
                                                    .checkOutToFirestore(
                                                        email: FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .email!);
                                              })),
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.history_outlined),
                            const SizedBox(
                              width: 5.0,
                            ),
                            const Text(
                              "Attendance History",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        ElevatedButton(
                            onPressed: () =>
                                navPushTransition(context, TestingPage()),
                            child: Text("A")),
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('absen')
                              .snapshots(),
                          builder: (context, snapshot) {
                            return ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                final items = snapshot.data!.docs[index];
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
                                return Column(
                                  children: [
                                    for (int i = 0; i < maxLength; i++)
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                DateFormat("E, d MMM yyyy")
                                                    .format(DateTime.parse(
                                                        dateCheckInList[i]
                                                            .toDate()
                                                            .toString()))
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15.0,
                                              ),
                                              Text.rich(TextSpan(children: [
                                                TextSpan(
                                                  text: DateFormat("Hm")
                                                      .format(DateTime.parse(
                                                          dateCheckInList[i]
                                                              .toDate()
                                                              .toString()))
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: " - ",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: DateFormat("Hm")
                                                      .format(DateTime.parse(
                                                          dateCheckOutList[i]
                                                              .toDate()
                                                              .toString()))
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ]))
                                            ],
                                          ),
                                          Divider()
                                        ],
                                      ),
                                  ],
                                );
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
