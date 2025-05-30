import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/home_latest_transaction_item.dart';
import 'package:bank_sha/ui/widgets/home_service_item.dart';
import 'package:bank_sha/ui/widgets/home_tips_item.dart';
import 'package:bank_sha/ui/widgets/home_user_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        elevation: 0,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: whiteColor,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/ic_overview.png",
                width: 20,
                color: blueColor,
              ),
              label: "Overview",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/ic_history.png", width: 20),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/ic_statistic.png", width: 20),
              label: "Statistic",
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/ic_reward.png", width: 20),
              label: "Reward",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: purpleColor,
        onPressed: () => (),
        child: Image.asset("assets/ic_plus_circle.png", width: 24),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildProfile(context),
          buildWalletCard(),
          buildLevel(),
          buildServices(context),
          buildLatestTransaction(),
          buildSendAgain(),
          buidFriendlyTips(),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Howdy", style: greyTextStyle.copyWith(fontSize: 16)),
              SizedBox(height: 2),
              Text(
                "shaynahan",
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/profile"),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/img_profile.png"),
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle,
                      color: greenColor,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWalletCard() {
    return Container(
      width: double.infinity,
      height: 220,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: DecorationImage(
          image: AssetImage("assets/img_bg_card.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Shayna Hanna",
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
          ),
          SizedBox(height: 28),
          Text(
            "**** **** **** 1280",
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              letterSpacing: 6,
            ),
          ),
          SizedBox(height: 21),
          Text("Balance", style: whiteTextStyle),
          Text(
            "Rp 12.500",
            style: whiteTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
        ],
      ),
    );
  }

  Widget buildLevel() {
    return Container(
      margin: EdgeInsets.only(top: 17),
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Level 1",
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              Spacer(),
              Text(
                "55%",
                style: greenTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                " of Rp 20.000",
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 0.55,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServices(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Do Something",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                iconUrl: "assets/ic_topup.png",
                title: "Top Up",
                onTap: () => (Navigator.pushNamed(context, "/topup")),
              ),
              HomeServiceItem(
                iconUrl: "assets/ic_send.png",
                title: "Send",
                onTap: () => (Navigator.pushNamed(context, "/transfer")),
              ),
              HomeServiceItem(
                iconUrl: "assets/ic_withdraw.png",
                title: "Withdraw",
                onTap: () => (),
              ),
              HomeServiceItem(
                iconUrl: "assets/ic_more.png",
                title: "More",
                onTap: () => (),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLatestTransaction() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest Transactions",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),
          Container(
            padding: EdgeInsets.all(22),
            margin: EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                HomeLatestTransactionItem(
                  iconUrl: "assets/ic_transaction_cat1.png",
                  title: "Top Up",
                  time: "Yesterday",
                  value: "+ 450.000",
                ),
                HomeLatestTransactionItem(
                  iconUrl: "assets/ic_transaction_cat2.png",
                  title: "Cashback",
                  time: "Sep 11",
                  value: "+ 22.000",
                ),
                HomeLatestTransactionItem(
                  iconUrl: "assets/ic_transaction_cat3.png",
                  title: "Withdraw",
                  time: "Sep 2",
                  value: "- 5.000",
                ),
                HomeLatestTransactionItem(
                  iconUrl: "assets/ic_transaction_cat4.png",
                  title: "Transfer",
                  time: "Aug 27",
                  value: "- 123.500",
                ),
                HomeLatestTransactionItem(
                  iconUrl: "assets/ic_transaction_cat5.png",
                  title: "Transfer",
                  time: "Aug 27",
                  value: "- 12.300.000",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Send Again",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeUserItem(
                  imageUrl: "assets/img_friend1.png",
                  username: "yuanita",
                ),
                HomeUserItem(
                  imageUrl: "assets/img_friend2.png",
                  username: "jani",
                ),
                HomeUserItem(
                  imageUrl: "assets/img_friend3.png",
                  username: "urip",
                ),
                HomeUserItem(
                  imageUrl: "assets/img_friend4.png",
                  username: "masa",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buidFriendlyTips() {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Friendly Tips",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),
          Wrap(
            spacing: 17,
            runSpacing: 18,
            children: [
              HomeTipsItem(
                imageUrl: "assets/img_tips1.png",
                title: "Best tips for using a credit card overflow",
                url: "https://www.google.com",
              ),
              HomeTipsItem(
                imageUrl: "assets/img_tips2.png",
                title: "Spot the good pie of finance model",
                url: "https://www.pub.dev",
              ),
              HomeTipsItem(
                imageUrl: "assets/img_tips3.png",
                title: "Great hack to get better advices",
                url: "https://www.google.com",
              ),
              HomeTipsItem(
                imageUrl: "assets/img_tips4.png",
                title: "Save more penny buy this instead",
                url: "https://www.google.com",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
