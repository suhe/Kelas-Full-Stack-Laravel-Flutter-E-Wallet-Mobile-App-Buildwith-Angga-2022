import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/data_provider_item.dart';
import 'package:flutter/material.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beli Data"),
        leading: CustomHomeBackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 30),
          Text(
            "From Wallet",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Image.asset("assets/img_wallet.png", width: 80),
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
                    "Balance : ${formatCurrency(1800000)}",
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 40),
          Text(
            "Select Provider",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),
          DataProviderItem(
            name: "Telkomsel",
            imageUrl: "assets/img_provider_telkomsel.png",
            isSelected: true,
          ),
          DataProviderItem(
            name: "Indosat Ooredoo",
            imageUrl: "assets/img_provider_indosat.png",
          ),
          DataProviderItem(
            name: "Singtel ID",
            imageUrl: "assets/img_provider_singtel.png",
          ),
          SizedBox(height: 135),
          CustomFilledButton(
            title: "Continue",
            onPressed: () => (Navigator.pushNamed(context, "/data-package")),
          ),
          SizedBox(height: 57),
        ],
      ),
    );
  }
}
