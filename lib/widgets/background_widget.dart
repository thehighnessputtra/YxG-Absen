import 'package:absensi_online/utils/constant.dart';
import 'package:flutter/material.dart';

class MyBackgroundWidget extends StatelessWidget {
  const MyBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
      ],
    );
  }
}
