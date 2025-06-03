import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        leading: CustomHomeBackButton(onPressed: () => Navigator.pop(context)),
        title: Text("My Profile"),
        //backgroundColor: lightBackgroundColor,
        //elevation: 0,
        //centerTitle: true,
        //iconTheme: IconThemeData(color: blackColor),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/sign-in',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is AuthSuccess) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              children: [
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 22),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
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
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: whiteColor,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.check_circle,
                                        color: greenColor,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                )
                                : null,
                      ),
                      SizedBox(height: 16),
                      Text(
                        state.user.name.toString(),
                        textAlign: TextAlign.center,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(height: 40),
                      ProfileMenuItem(
                        iconUrl: "assets/ic_edit_profile.png",
                        title: "Edit Profile",
                        onTap: () async {
                          if (await Navigator.pushNamed(context, "/pin") ==
                                  true &&
                              context.mounted) {
                            Navigator.pushNamed(context, "/profile-edit");
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconUrl: "assets/ic_pin.png",
                        title: "My Pin",
                        onTap: () async {
                          if (await Navigator.pushNamed(context, "/pin") ==
                                  true &&
                              context.mounted) {
                            Navigator.pushNamed(context, "/profile-edit-pin");
                          }
                        },
                      ),
                      ProfileMenuItem(
                        iconUrl: "assets/ic_wallet.png",
                        title: "Wallet Settings",
                        onTap: () => (),
                      ),
                      ProfileMenuItem(
                        iconUrl: "assets/ic_reward.png",
                        title: "My Rewars",
                        onTap: () => (),
                      ),
                      ProfileMenuItem(
                        iconUrl: "assets/ic_help.png",
                        title: "Help Center",
                        onTap: () => (),
                      ),
                      ProfileMenuItem(
                        iconUrl: "assets/ic_logout.png",
                        title: "Log Out",
                        onTap:
                            () => (context.read<AuthBloc>().add(AuthLogout())),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 87),
                CustomTextButton(
                  title: "Report a Problem",
                  onPressed: () => (),
                ),
                SizedBox(height: 50),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
