import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/package_item.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel operatorCard;

  const DataPackagePage({super.key, required this.operatorCard});

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController();
  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paket Data"),
        leading: CustomHomeBackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 30),
          Text(
            "Phone Number",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),
          CustomFormField(
            title: "+628",
            isShowTitle: false,
            controller: phoneController,
          ),
          SizedBox(height: 40),
          Text(
            "Select Package",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),

          Wrap(
            spacing: 17,
            runSpacing: 17,
            children:
                widget.operatorCard.dataPlans!.map((dataPlan) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDataPlan = dataPlan;
                      });
                    },
                    child: PackageItem(
                      dataPlan: dataPlan,
                      isSelected: dataPlan.id == selectedDataPlan?.id,
                    ),
                  );
                }).toList(),
          ),

          //SizedBox(height: 85),
          /*
          CustomFilledButton(
            title: "Continue",
            onPressed: () async {
              if (await Navigator.pushNamed(context, "/pin") == true &&
                  context.mounted) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/data-success",
                  (route) => false,
                );
              }
            },
          ),*/
          SizedBox(height: 57),
        ],
      ),
      floatingActionButton:
          (selectedDataPlan != null && phoneController.text.isNotEmpty)
              ? Container(
                margin: EdgeInsets.all(24),
                child: CustomFilledButton(
                  title: "Continue",
                  //onPressed: () => Navigator.pushNamed(context, "/topup-amount"),
                  onPressed: () {},
                ),
              )
              : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
