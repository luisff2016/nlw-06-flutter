import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflowprevious/shared/auth/auth_controller.dart';
import 'package:payflowprevious/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        // usar se quiser acesso aos dados sensiveis do usuario
        // 'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();

      final user =
          UserModel(name: response!.displayName!, photoURL: response.photoUrl);

      authController.setUser(context, user);
      print(response);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}
