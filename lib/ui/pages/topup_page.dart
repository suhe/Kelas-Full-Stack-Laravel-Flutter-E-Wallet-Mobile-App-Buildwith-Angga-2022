import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/payment_method/payment_method_bloc.dart';
import 'package:bank_sha/models/payment_method_model.dart';
import 'package:bank_sha/models/topup_form_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/topup_amount_page.dart';
import 'package:bank_sha/ui/widgets/bank_item.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Up"),
        leading: CustomHomeBackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 30),
          Text(
            "Wallet",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 10),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
                  children: [
                    Image.asset(
                      "assets/img_wallet.png",
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!
                              .replaceAllMapped(
                                RegExp(r".{4}"),
                                (match) => "${match.group(0)} ",
                              )
                              .toString(),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Angga Risky",
                          style: greyTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
          SizedBox(height: 40),
          Text(
            "Select Bank",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodSuccess) {
                  return Column(
                    children:
                        state.paymentMethods.map((paymentMethod) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPaymentMethod = paymentMethod;
                              });
                            },
                            child: BankItem(
                              paymentMethod: paymentMethod,
                              isSelected:
                                  paymentMethod.id == selectedPaymentMethod?.id,
                            ),
                          );
                        }).toList(),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          SizedBox(height: 12),
          if (selectedPaymentMethod != null)
            CustomFilledButton(
              title: "Continue",
              //onPressed: () => Navigator.pushNamed(context, "/topup-amount"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => TopupAmountPage(
                          data: TopupFormModel(
                            paymentMethodCode: selectedPaymentMethod?.code,
                          ),
                        ),
                  ),
                );
              },
            ),

          SizedBox(height: 57),
        ],
      ),
    );
  }
}
