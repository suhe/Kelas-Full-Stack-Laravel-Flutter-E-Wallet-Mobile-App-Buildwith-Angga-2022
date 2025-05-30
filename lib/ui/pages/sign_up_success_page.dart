import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class SignUpSuccessPage extends StatelessWidget {
  const SignUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Akun Berhasil\n Terdaftar",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 26),
            Text(
              "Grow your finance start\n together with us",
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            ),
            SizedBox(height: 50),
            CustomFilledButton(
              title: "Get Started",
              onPressed:
                  () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/home",
                    (route) => false,
                  ),
              width: 183,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
