import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TransferSuccessPage extends StatelessWidget {
  const TransferSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Berhasil Transfer",
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 26),
            Text(
              "Use the money wisely and\n grow your finance",
              textAlign: TextAlign.center,
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            ),
            SizedBox(height: 50),
            CustomFilledButton(
              title: "Back to Home",
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
