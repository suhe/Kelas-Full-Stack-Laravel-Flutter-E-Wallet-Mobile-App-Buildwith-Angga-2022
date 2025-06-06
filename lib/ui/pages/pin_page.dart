import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: "");
  String pin = '';
  bool isError = false;

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }

    if (pinController.text.length == 6) {
      if (pinController.text == pin) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          isError = true;
        });
        showCustomSnackbar(
          context,
          "Pin yang anda masukan salah, Silahkan coba lagi",
        );
      }
    }

    //debugPrint("number ${pinController.text}");
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        isError = false;
        pinController.text = pinController.text.substring(
          0,
          pinController.text.length - 1,
        );
      });

      //debugPrint("number ${pinController.text}");
    }
  }

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      pin = authState.user.pin!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sha PIN",
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(height: 72),
              SizedBox(
                width: 200,
                child: TextFormField(
                  enabled: false,
                  controller: pinController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  cursorColor: greyColor,
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium,
                    letterSpacing: 16,
                    color: isError ? redColor : whiteColor,
                  ),
                  maxLength: 6,
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 66),

              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  CustomInputButton(title: "1", onTap: () => (addPin("1"))),
                  CustomInputButton(title: "2", onTap: () => (addPin("2"))),
                  CustomInputButton(title: "3", onTap: () => (addPin("3"))),
                  CustomInputButton(title: "4", onTap: () => (addPin("4"))),
                  CustomInputButton(title: "5", onTap: () => (addPin("5"))),
                  CustomInputButton(title: "6", onTap: () => (addPin("6"))),
                  CustomInputButton(title: "7", onTap: () => (addPin("7"))),
                  CustomInputButton(title: "8", onTap: () => (addPin("8"))),
                  CustomInputButton(title: "9", onTap: () => (addPin("9"))),
                  SizedBox(width: 60, height: 60),
                  CustomInputButton(title: "0", onTap: () => ()),
                  CustomInputIconButton(
                    icon: Icon(Icons.arrow_back, color: whiteColor, size: 24),
                    onTap: () => (deletePin()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
