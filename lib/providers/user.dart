import 'package:flutter/widgets.dart';

class User {
  String username;
  String password;
  String email;
  User({
    @required this.username,
    @required this.password,
    @required this.email,
  });

  String get getUser {
    return this.username;
  }

  String get getPass {
    return this.password;
  }

  String get getEmail {
    return this.email;
  }

  void setUsername(String username) {
    this.username = username;
  }

  void setPassword(String password) {
    this.password = password;
  }

  void setEmail(String email) {
    this.email = email;
  }
}
