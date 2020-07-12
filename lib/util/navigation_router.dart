import 'package:flutter/material.dart';

class NavigationRouter {
  static void switchToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, "/Login", (Route<dynamic> route) => false);
  }

  static void switchToRegistration(BuildContext context) {
    Navigator.pushNamed(context, "/RegistrationScreen");
  }

  static void switchToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, "/HomeScreen", (Route<dynamic> route) => false);
  }

  static void switchToProfile(BuildContext context) {
    Navigator.pushNamed(context, "/ProfileScreen");
  }

}
