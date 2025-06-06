import 'dart:async';

import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class SplashPageBackup extends StatefulWidget {
  const SplashPageBackup({super.key});

  @override
  State<SplashPageBackup> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPageBackup> {
  /*
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/onboarding",
        (route) => false,
      );
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Container(
          width: 155,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img_logo_dark.png"),
            ),
          ),
        ),
      ),
    );
  }
}
