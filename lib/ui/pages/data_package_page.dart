import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paket Data"),
        leading: CustomHomeBackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 30),
          Text(
            "Phone Number",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),
          CustomFormField(title: "+628", isShowTitle: false),
          SizedBox(height: 40),
          Text(
            "Select Package",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),

          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              PackageItem(amount: 10, price: 218000, isSelected: false),
              PackageItem(amount: 25, price: 420000, isSelected: false),
              PackageItem(amount: 40, price: 2500000, isSelected: true),
              PackageItem(amount: 99, price: 5000000, isSelected: false),
            ],
          ),

          SizedBox(height: 135),
          CustomFilledButton(
            title: "Continue",
            onPressed: () async {
              if (await Navigator.pushNamed(context, "/pin") == true &&
                  context.mounted) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/data-success",
                  (route) => false,
                );
              }
            },
          ),
          SizedBox(height: 57),
        ],
      ),
    );
  }
}
