import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflowprevious/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  // ignore: unused_field

  late UserModel _user;

  UserModel get user => _user;

  void setUser(BuildContext context, UserModel user) {
    // ignore: unnecessary_null_comparison
    if (user != null) {
      _user = user;
      // para rota nomeada
      Navigator.pushReplacementNamed(context, "/home");
      // para rota sem nome
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      // para rota nomeada
      Navigator.pushReplacementNamed(context, "/login");
      // para rota sem nome
      // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("nome")) {
      final json = instance.get("user") as String;
      setUser(context, UserModel.fromJson(json));
      return;
    } else {
      setUser(context, UserModel(name: "", photoURL: ""));
    }
  }
}
