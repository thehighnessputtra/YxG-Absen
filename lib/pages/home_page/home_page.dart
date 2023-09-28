// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:absensi_online/services/firebase_services.dart';
import 'package:absensi_online/test.dart';
import 'package:absensi_online/utils/constant.dart';
import 'package:absensi_online/widgets/custom_button.dart';
import 'package:absensi_online/widgets/custom_notification.dart';
import 'package:absensi_online/widgets/transition_widget.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 50),
                    height: MediaQuery.of(context).size.height / 2 - 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
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
                            bottomLeft: Radius.elliptical(300, 300),
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
                            SizedBox(
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
                                Text("Jacob Hones",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                                Text("Jabatan",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xffF4F4F4),
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  FirebaseServices(FirebaseAuth.instance)
                                      .signOut(context);
                                },
                                icon: Icon(
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(20),
                          height: 250,
                          width: double.infinity,
                          child: StreamBuilder(
                            stream: Stream.periodic(const Duration(seconds: 1)),
                            builder: (context, snapshot) {
                              return Column(
                                children: [
                                  Text(
                                    "Live Atendance",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    DateFormat("Hms").format(DateTime.now()),
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff426689)),
                                  ),
                                  Text(
                                    DateFormat("EEEE, d MMMM y")
                                        .format(DateTime.now()),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff5D5D5D)),
                                  ),
                                  Divider(),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Office Hours",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff5D5D5D)),
                                  ),
                                  Text(
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
                                            onPress: () {}),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    3 +
                                                10,
                                        child: CustomButton1(
                                            btnName: "Check Out",
                                            onPress: () {}),
                                      ),
                                    ],
                                  ),
                                  Divider(),
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
                            Icon(Icons.history_outlined),
                            const SizedBox(
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
                        ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          shrinkWrap: true,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Mon, 18 April 2023",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Text.rich(TextSpan(children: [
                                      TextSpan(
                                        text: "08:00",
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
                                        text: "05:00",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ]))
                                  ],
                                ),
                                Divider()
                              ],
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
