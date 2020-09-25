import 'package:PoolIIIT_mobileApp/models/http_exception.dart';
import 'package:PoolIIIT_mobileApp/providers/allUsers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import '../providers/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  List<CustomUser> _allUsers = new List<CustomUser>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CustomUser _userFromFirebaseUser(FirebaseUser user, String username) {
    return user != null
        ? CustomUser(
            username: username,
            email: user.providerData[0].email,
            uid: user.uid,
          )
        : null;
  }

  Future addUserToFirebase(FirebaseUser user, String username) async {
    const url = "https://pool-iiit.firebaseio.com/users.json";
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "uid": user.uid,
            "username": username,
            "email": user.email,
          },
        ),
      );
      print(json.decode(response.body));
      _allUsers.add(
        CustomUser(
          username: username,
          email: user.email,
          uid: user.uid,
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<CustomUser> userDetails(String uid) async {
    const url = "https://pool-iiit.firebaseio.com/users.json";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    CustomUser user = new CustomUser(
      username: "",
      email: "",
      uid: "",
    );
    extractedData.forEach((key, value) {
      if (uid == value['uid']) {
        user.setEmail(value["email"]);
        user.setUsername(value["username"]);
        user.setID(value["uid"]);
      }
    });
    return user;
  }

  Future registerWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      FirebaseUser user = result.user;
      notifyListeners();
      addUserToFirebase(user, username);
      return _userFromFirebaseUser(user, username);
    } catch (e) {
      return null;
    }
  }

  Future signInWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      //print(result);
      notifyListeners();
      return userDetails(user.uid);
    } catch (e) {
      return null;
    }
  }
}
