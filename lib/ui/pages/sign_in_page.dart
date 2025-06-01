import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/sign_in_form_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
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

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
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
                "Sign In &\n Grow Your Finance",
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
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("Forgot Password", style: blueTextStyle),
                    ),
                    SizedBox(height: 30),

                    CustomFilledButton(
                      title: "Sign",
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                            AuthLogin(
                              SignInFormModel(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            ),
                          );
                        } else {
                          showCustomSnackbar(
                            context,
                            'Semua field harus diisi',
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50),
              CustomTextButton(
                title: "Create New A Account",
                onPressed: () => Navigator.pushNamed(context, "/sign-up"),
              ),
            ],
          );
        },
      ),
    );
  }
}
