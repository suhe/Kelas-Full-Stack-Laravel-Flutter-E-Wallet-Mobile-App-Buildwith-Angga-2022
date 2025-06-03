// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserEditFormModel {
  final String? username;
  final String? name;
  final String? email;
  final String? password;

  UserEditFormModel({this.username, this.name, this.email, this.password});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
