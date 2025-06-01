import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class SignUpSetKtpPage extends StatelessWidget {
  final SignUpFormModel data;

  const SignUpSetKtpPage({super.key, required this.data});

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
            "Verify Your\n Account",
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
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBackgroundColor,
                  ),
                  child: Center(
                    child: Image.asset("assets/ic_upload.png", width: 32),
                  ),
                ),
                /*
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/img_profile.png"),
                    ),
                  ),
                ),*/
                SizedBox(height: 16),
                Text(
                  "Passport/ID Card",
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 50),

                CustomFilledButton(title: "Continue"),
              ],
            ),
          ),

          SizedBox(height: 60),
          CustomTextButton(
            title: "Skip for Now",
            onPressed: () => Navigator.pushNamed(context, "/sign-up-success"),
          ),
        ],
      ),
    );
  }
}
