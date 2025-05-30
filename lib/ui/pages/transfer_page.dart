import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer"),
        leading: CustomHomeBackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 30),
          Text(
            "Search",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),
          CustomFormField(title: "by username", isShowTitle: false),
          //if(textController.text = "")
          //buildRecentUsers(),
          buildResults(),
          SizedBox(height: 274),
          CustomFilledButton(
            title: "Continue",
            onPressed: () => (Navigator.pushNamed(context, "/transfer-amount")),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Users",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),
          TransferRecentUserItem(
            imageUrl: "assets/img_friend1.png",
            name: "Yonna Jie",
            username: "yoenna",
            isVerified: true,
          ),
          TransferRecentUserItem(
            imageUrl: "assets/img_friend2.png",
            name: "John Hi",
            username: "jhi",
            isVerified: false,
          ),
          TransferRecentUserItem(
            imageUrl: "assets/img_friend3.png",
            name: "Masayoshi",
            username: "form",
            isVerified: false,
          ),
        ],
      ),
    );
  }

  Widget buildResults() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Result",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),

          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              TransferResultUserItem(
                imageUrl: "assets/img_friend1.png",
                name: "Yoana Jie",
                username: "yunji",
                isVerified: false,
                isSelected: true,
              ),
              TransferResultUserItem(
                imageUrl: "assets/img_friend2.png",
                name: "Yoana Koe",
                username: "ykoe",
                isVerified: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
