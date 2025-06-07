import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class DataProviderItem extends StatelessWidget {
  /*final String name;
  final String imageUrl;
  */
  final OperatorCardModel operatorCard;
  final bool isSelected;

  const DataProviderItem({
    super.key,
    required this.operatorCard,
    //required this.imageUrl,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(22),
      margin: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: isSelected ? Border.all(color: blueColor, width: 2) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(operatorCard.thumbnail.toString(), height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                operatorCard.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              SizedBox(height: 2),
              Text(
                operatorCard.status.toString(),
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
