import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/user_edit_form_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final usernameController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      usernameController.text = authState.user.username!;
      nameController.text = authState.user.name!;
      emailController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomHomeBackButton(onPressed: () => Navigator.pop(context)),
        title: Text("Edit Profile"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/profile-edit-success",
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
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
                    CustomFormField(
                      title: "Username",
                      controller: usernameController,
                    ),
                    SizedBox(height: 16),
                    CustomFormField(
                      title: "Full Name",
                      controller: nameController,
                    ),
                    SizedBox(height: 16),
                    CustomFormField(
                      title: "Email Address",
                      controller: emailController,
                    ),
                    SizedBox(height: 16),
                    CustomFormField(
                      title: "Password",
                      obscureText: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: 30),

                    CustomFilledButton(
                      title: "Update Now",
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          AuthUpdateUser(
                            UserEditFormModel(
                              username: usernameController.text,
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
