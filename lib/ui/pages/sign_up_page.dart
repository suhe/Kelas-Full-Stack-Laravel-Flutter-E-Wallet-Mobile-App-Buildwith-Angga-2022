import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img_logo_light.png"),
              ),
            ),
          ),

          SizedBox(height: 100),
          Text(
            "Join Us to Unlock\n Your Growth",
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                //NOTE:FUllname Input
                CustomFormField(title: "Full Name"),
                SizedBox(height: 16),
                //NOTE:Email Input
                CustomFormField(title: "Email Address"),
                SizedBox(height: 16),
                //NOTE:Password
                CustomFormField(title: "Password", obscureText: true),

                SizedBox(height: 30),

                CustomFilledButton(
                  title: "Continue",
                  onPressed:
                      () =>
                          Navigator.pushNamed(context, "/sign-up-set-profile"),
                ),
              ],
            ),
          ),

          SizedBox(height: 50),
          CustomTextButton(
            title: "Sign In",
            onPressed: () => Navigator.pushNamed(context, "/sign-in"),
          ),
        ],
      ),
    );
  }
}
