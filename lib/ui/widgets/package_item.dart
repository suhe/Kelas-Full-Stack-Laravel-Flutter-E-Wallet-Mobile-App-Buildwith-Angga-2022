import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class PackageItem extends StatelessWidget {
  //final int amount;
  //final int price;
  final DataPlanModel dataPlan;
  final bool isSelected;

  const PackageItem({
    super.key,
    //required this.amount,
    //required this.price,
    required this.dataPlan,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 175,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dataPlan.name.toString(),
            style: blackTextStyle.copyWith(fontSize: 32, fontWeight: medium),
          ),
          SizedBox(height: 2),
          Text(
            formatCurrency(dataPlan.price ?? 0),
            style: greyTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
