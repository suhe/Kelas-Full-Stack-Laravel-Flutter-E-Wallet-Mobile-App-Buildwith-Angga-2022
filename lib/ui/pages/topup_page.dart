import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/bank_item.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Up"),
        leading: CustomHomeBackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 30),
          Text(
            "Wallet",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Image.asset(
                "assets/img_wallet.png",
                width: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "8008 2208 1996",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Angga Risky",
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
          Text(
            "Select Bank",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),
          BankItem(
            title: "Bank BCA",
            imageUrl: "assets/img_bank_bca.png",
            isSelected: true,
          ),
          BankItem(title: "Bank BNI", imageUrl: "assets/img_bank_bni.png"),
          BankItem(
            title: "Bank Mandiri",
            imageUrl: "assets/img_bank_mandiri.png",
          ),
          BankItem(title: "Bank OCBC", imageUrl: "assets/img_bank_ocbc.png"),
          SizedBox(height: 12),
          CustomFilledButton(
            title: "Continue",
            onPressed: () => Navigator.pushNamed(context, "/topup-amount"),
          ),
          SizedBox(height: 57),
        ],
      ),
    );
  }
}
