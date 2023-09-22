import 'package:absensi_online/utils/constant.dart';
import 'package:flutter/material.dart';

void customNotification(BuildContext context,
    {required String message,
    String tittle = "Notification",
    isError = false,
    isSuccess = false,
    IconData icon = Icons.notifications}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    // animation: ,
    content: Stack(clipBehavior: Clip.none, children: [
      Container(
          padding: EdgeInsets.all(10),
          height: 60,
          decoration: BoxDecoration(
              color: isError == true
                  ? colorDanger
                  : isSuccess == true
                      ? colorSuccess
                      : colorDarkBlue,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        isError == true
                            ? "ERROR"
                            : isSuccess == true
                                ? "SUCCESS"
                                : tittle,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)),
                    Text(message,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1),
                  ],
                ),
              ),
            ],
          )),
      Positioned(
        top: -8,
        left: -8,
        child: SizedBox(
          height: 40,
          child: CircleAvatar(
            backgroundColor: isError == true
                ? colorDanger
                : isSuccess == true
                    ? colorSuccess
                    : colorDarkBlue,
            child: Icon(
                isError == true
                    ? Icons.error
                    : isSuccess == true
                        ? Icons.check_circle
                        : icon,
                color: Colors.white),
          ),
        ),
      )
    ]),
    elevation: 0,
    backgroundColor: Colors.transparent,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - 140,
      left: 10,
      right: 10,
    ),
  ));
}
