import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/home_latest_transaction_item.dart';
import 'package:bank_sha/ui/widgets/home_service_item.dart';
import 'package:bank_sha/ui/widgets/home_tips_item.dart';
import 'package:bank_sha/ui/widgets/home_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
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
                      state.user.username!,
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
                        image:
                            state.user.profilePicture == null
                                ? AssetImage("assets/img_profile.png")
                                : NetworkImage(state.user.profilePicture!)
                                    as ImageProvider,
                      ),
                    ),
                    child:
                        state.user.verified == 1
                            ? Align(
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
                            )
                            : null,
                  ),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget buildWalletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
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
                  state.user.name.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 28),
                Text(
                  "**** **** **** ${state.user.cardNumber!.substring(12, 16)}",
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                    letterSpacing: 6,
                  ),
                ),
                SizedBox(height: 21),
                Text("Balance", style: whiteTextStyle),
                Text(
                  formatCurrency(state.user.balance ?? 0),
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          );
        }

        return Container();
      },
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
                " of ${formatCurrency(20000)}",
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
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => MoreDialog(),
                  );
                },
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
                  value: "+ ${formatCurrency(450000, symbol: "")}",
                ),
                HomeLatestTransactionItem(
                  iconUrl: "assets/ic_transaction_cat2.png",
                  title: "Cashback",
                  time: "Sep 11",
                  value: "+ ${formatCurrency(22000, symbol: "")}",
                ),
                HomeLatestTransactionItem(
                  iconUrl: "assets/ic_transaction_cat3.png",
                  title: "Withdraw",
                  time: "Sep 2",
                  value: "- ${formatCurrency(5000, symbol: "")}",
                ),
                HomeLatestTransactionItem(
                  iconUrl: "assets/ic_transaction_cat4.png",
                  title: "Transfer",
                  time: "Aug 27",
                  value: "- ${formatCurrency(123500, symbol: "")}",
                ),
                HomeLatestTransactionItem(
                  iconUrl: "assets/ic_transaction_cat5.png",
                  title: "Transfer",
                  time: "Aug 27",
                  value: "- ${formatCurrency(12300000, symbol: "")}",
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

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        padding: EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        height: 326,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Do More With Us",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 13),
            Wrap(
              spacing: 29,
              runSpacing: 25,
              children: [
                HomeServiceItem(
                  iconUrl: "assets/ic_product_data.png",
                  title: "Data",
                  onTap: () => (Navigator.pushNamed(context, '/data-provider')),
                ),
                HomeServiceItem(
                  iconUrl: "assets/ic_product_water.png",
                  title: "Water",
                  onTap: () => (),
                ),
                HomeServiceItem(
                  iconUrl: "assets/ic_product_stream.png",
                  title: "Stream",
                  onTap: () => (),
                ),
                HomeServiceItem(
                  iconUrl: "assets/ic_product_movie.png",
                  title: "Movie",
                  onTap: () => (),
                ),
                HomeServiceItem(
                  iconUrl: "assets/ic_product_food.png",
                  title: "Food",
                  onTap: () => (),
                ),
                HomeServiceItem(
                  iconUrl: "assets/ic_product_travel.png",
                  title: "Travel",
                  onTap: () => (),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
