class SignInFormModel {
  final String email;
  final String password;

  SignInFormModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
