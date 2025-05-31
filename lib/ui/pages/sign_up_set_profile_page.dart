import 'dart:io';

import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpSetProfilePage({super.key, required this.data});

  @override
  State<SignUpSetProfilePage> createState() => _SignUpSetProfilePageState();
}

class _SignUpSetProfilePageState extends State<SignUpSetProfilePage> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.data.toJson().toString());

    return Scaffold(
      //backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          GestureDetector(
            onTap: () async {
              final image = await selectImage();
              setState(() {
                selectedImage = image;
              });
            },
            child: Container(
              width: 155,
              height: 50,
              margin: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img_logo_light.png"),
                ),
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
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBackgroundColor,
                    image:
                        selectedImage == null
                            ? null
                            : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(selectedImage!.path)),
                            ),
                  ),
                  child:
                      selectedImage != null
                          ? null
                          : Center(
                            child: Image.asset(
                              "assets/ic_upload.png",
                              width: 32,
                            ),
                          ),
                ),
                /*Container(
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
                  "Shayna Hanna",
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 30),
                //NOTE:PIN
                CustomFormField(
                  title: "Set PIN (6 digit number)",
                  obscureText: true,
                  controller: pinController,
                ),

                SizedBox(height: 43),

                CustomFilledButton(
                  title: "Continue",
                  onPressed:
                      () => Navigator.pushNamed(context, "/sign-up-set-ktp"),
                ),
              ],
            ),
          ),

          SizedBox(height: 50),
        ],
      ),
    );
  }
}
