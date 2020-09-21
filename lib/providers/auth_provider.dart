import 'package:PoolIIIT_mobileApp/models/http_exception.dart';
import 'package:PoolIIIT_mobileApp/providers/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import '../providers/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  /*Future<void> _authenticate(String email, String password, String type) async {
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:$type?key=AIzaSyBH1xjGvR52VIjVeGx846GcTqtSpwbrYi0";
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );
      if (json.decode(response.body)['error'] != null) {
        throw HttpException(
          json.decode(response.body)['error']['message'],
        );
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:SignUp?key=AIzaSyBH1xjGvR52VIjVeGx846GcTqtSpwbrYi0";
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );
      if (json.decode(response.body)['error'] != null) {
        throw HttpException(
          json.decode(response.body)['error']['message'],
        );
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "signInWithPassword");
  }*/
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      notifyListeners();
      return _userFromFirebaseUser(user);
    } catch (e) {
      //print(e);
      //notifyListeners();
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      notifyListeners();
      return _userFromFirebaseUser(user);
    } catch (e) {
      //print(e);
      //notifyListeners();
      return null;
    }
  }
}
