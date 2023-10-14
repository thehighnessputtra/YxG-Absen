import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceHistory extends StatelessWidget {
  String email = "";
  List dateCheckInList = [];
  List dateCheckOutList = [];
  AttendanceHistory(
      {required this.email,
      required this.dateCheckOutList,
      required this.dateCheckInList,
      super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    int maxLength = dateCheckInList.length;
    if (dateCheckOutList.length < maxLength) {
      maxLength = dateCheckOutList.length;
    }
    if (dateCheckInList.isEmpty) {
      return CircularProgressIndicator();
    } else {
      return Column(
        children: [
          for (int i = 0; i < maxLength; i++)
            email == firebaseAuth.currentUser!.email!
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat("E, d MMM yyyy")
                                .format(DateTime.parse(
                                    dateCheckInList[i].toDate().toString()))
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
                                      dateCheckInList[i].toDate().toString()))
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
                                      dateCheckOutList[i].toDate().toString()))
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
                  )
                : SizedBox(),
        ],
      );
    }
  }
}
