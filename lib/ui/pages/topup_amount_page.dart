import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TopupAmountPage extends StatefulWidget {
  const TopupAmountPage({super.key});

  @override
  State<TopupAmountPage> createState() => _TopupAmountPageState();
}

class _TopupAmountPageState extends State<TopupAmountPage> {
  final TextEditingController amountController = TextEditingController(
    text: "0",
  );

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;
      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(int.parse(text.replaceAll(".", ""))),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == "0") {
      amountController.text = "";
    }

    setState(() {
      amountController.text = amountController.text + number;
    });

    debugPrint("number ${amountController.text}");
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text.substring(
          0,
          amountController.text.length - 1,
        );

        if (amountController.text == "") {
          amountController.text = "0";
        }
      });

      //debugPrint("number ${pinController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 58),
        children: [
          SizedBox(height: 36),
          Center(
            child: Text(
              "Total Amount",
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          SizedBox(height: 67),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                enabled: false,
                controller: amountController,
                cursorColor: greyColor,
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                ),
                maxLength: 6,
                decoration: InputDecoration(
                  prefixIcon: Text(
                    "Rp",
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greyColor),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 66),

          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: [
              CustomInputButton(title: "1", onTap: () => (addAmount("1"))),
              CustomInputButton(title: "2", onTap: () => (addAmount("2"))),
              CustomInputButton(title: "3", onTap: () => (addAmount("3"))),
              CustomInputButton(title: "4", onTap: () => (addAmount("4"))),
              CustomInputButton(title: "5", onTap: () => (addAmount("5"))),
              CustomInputButton(title: "6", onTap: () => (addAmount("6"))),
              CustomInputButton(title: "7", onTap: () => (addAmount("7"))),
              CustomInputButton(title: "8", onTap: () => (addAmount("8"))),
              CustomInputButton(title: "9", onTap: () => (addAmount("9"))),
              SizedBox(width: 60, height: 60),
              CustomInputButton(title: "0", onTap: () => (addAmount("0"))),
              CustomInputIconButton(
                icon: Icon(Icons.arrow_back, color: whiteColor, size: 24),
                onTap: () => (deleteAmount()),
              ),
            ],
          ),

          SizedBox(height: 50),
          CustomFilledButton(
            title: "Checkout Now",
            onPressed: () async {
              if (await Navigator.pushNamed(context, "/pin") == true &&
                  context.mounted) {
                var url = Uri.parse("https://demo.midtrans.com/");

                launchUrl(url);

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/topup-success",
                  (route) => false,
                );
              }
            },
          ),
          SizedBox(height: 25),
          CustomTextButton(title: "Terms & Condition", onPressed: () => ()),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
