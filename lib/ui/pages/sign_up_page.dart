import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/sign_up_set_profile_page.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        passwordController.text.length < 6) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthCheckEmailSuccess) {
            //Navigator.pushNamed(context, "/sign-up-set-profile");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SignUpSetProfilePage(
                      data: SignUpFormModel(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    ),
              ),
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
                "Join Us to Unlock\n Your Growth",
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
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
                    //NOTE:FUllname Input
                    CustomFormField(
                      title: "Full Name",
                      controller: nameController,
                    ),
                    SizedBox(height: 16),
                    //NOTE:Email Input
                    CustomFormField(
                      title: "Email Address",
                      controller: emailController,
                    ),
                    SizedBox(height: 16),
                    //NOTE:Password
                    CustomFormField(
                      title: "Password",
                      obscureText: true,
                      controller: passwordController,
                    ),

                    SizedBox(height: 30),

                    CustomFilledButton(
                      title: "Continue",
                      onPressed: () {
                        if (validate()) {
                          //Navigator.pushNamed(context, "/sign-up-set-profile");
                          context.read<AuthBloc>().add(
                            AuthCheckEmail(emailController.text),
                          );
                        } else {
                          showCustomSnackbar(
                            context,
                            "Semua field harus diisi",
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),
              CustomTextButton(
                title: "Sign In",
                onPressed: () => Navigator.pushNamed(context, "/sign-in"),
              ),
              SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
