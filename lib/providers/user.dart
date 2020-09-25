import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyUser {
  String username;
  String password;
  String email;

  MyUser({
    @required this.username,
    @required this.password,
    @required this.email,
  });
}

class AllUsers with ChangeNotifier {
  var allUsers = new List();

  void addUser(String username, String password, String email) {
    MyUser new_user = new MyUser(
      username: username,
      password: password,
      email: email,
    );
    allUsers.add(new_user);
  }
}
