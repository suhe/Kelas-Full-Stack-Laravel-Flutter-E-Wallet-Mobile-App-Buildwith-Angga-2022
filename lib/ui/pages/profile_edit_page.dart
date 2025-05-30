import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomHomeBackButton(onPressed: () => Navigator.pop(context)),
        title: Text("Edit Profile"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                CustomFormField(title: "Username"),
                SizedBox(height: 16),
                CustomFormField(title: "Full Name"),
                SizedBox(height: 16),
                CustomFormField(title: "Email Address"),
                SizedBox(height: 16),
                CustomFormField(title: "Password", obscureText: true),
                SizedBox(height: 30),

                CustomFilledButton(
                  title: "Update Now",
                  onPressed:
                      () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        "/profile-edit-success",
                        (route) => false,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
