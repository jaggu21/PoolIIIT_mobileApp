import 'package:flutter/material.dart';

class CustomUser {
  String uid;
  String username;
  //String password;
  String email;
  CustomUser({
    @required this.username,
    //@required this.password,
    @required this.email,
    @required this.uid,
  });

  String get getUser {
    return this.username;
  }

  /*String get getPass {
    return this.password;
  }*/

  String get getEmail {
    return this.email;
  }

  String get getID {
    return this.uid;
  }

  void setUsername(String username) {
    this.username = username;
  }

  /*void setPassword(String password) {
    this.password = password;
  }*/

  void setEmail(String email) {
    this.email = email;
  }

  void setID(String id) {
    this.uid = id;
  }
}
