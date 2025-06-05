import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/models/transfer_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/transfer_amount_page.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:bank_sha/ui/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/ui/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final usernameController = TextEditingController(text: '');
  UserModel? selectedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();

    userBloc = context.read<UserBloc>()..add(UserGetRecent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transfer"),
        leading: CustomHomeBackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 30),
          Text(
            "Search",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),
          CustomFormField(
            title: "by username",
            isShowTitle: false,
            controller: usernameController,
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                userBloc.add(UserGetByUsername(value));
              } else {
                selectedUser = null;
                userBloc.add(UserGetRecent());
              }

              setState(() {});
            },
          ),
          //if(textController.text = "")
          usernameController.text.isEmpty ? buildRecentUsers() : buildResults(),
          //buildResults(),

          //SizedBox(height: 274),
          SizedBox(height: 24),
        ],
      ),
      floatingActionButton:
          selectedUser != null
              ? Container(
                margin: EdgeInsets.all(24),
                child: CustomFilledButton(
                  title: "Continue",
                  onPressed:
                      () => {
                        //(Navigator.pushNamed(context, "/transfer-amount"))
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => TransferAmountPage(
                                  data: TransferFormModel(
                                    sendTo: selectedUser!.username,
                                  ),
                                ),
                          ),
                        ),
                      },
                ),
              )
              : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Users",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),

          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSuccess) {
                return Column(
                  children:
                      state.users.map((user) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => TransferAmountPage(
                                      data: TransferFormModel(
                                        sendTo: user.username,
                                      ),
                                    ),
                              ),
                            );
                          },
                          child: TransferRecentUserItem(user: user),
                        );
                      }).toList(),
                );
              }

              //return Container();
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Widget buildResults() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Result",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(height: 14),

          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              debugPrint("state: $state");
              if (state is UserSuccess) {
                return Wrap(
                  spacing: 17,
                  runSpacing: 17,
                  children:
                      state.users.map((user) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedUser = user;
                            });
                          },
                          child: TransferResultUserItem(
                            user: user,
                            isSelected: user.id == selectedUser?.id,
                          ),
                        );
                      }).toList(),
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
