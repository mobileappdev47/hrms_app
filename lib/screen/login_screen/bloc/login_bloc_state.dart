import 'package:flutter/material.dart';

class LoginState {
  TextEditingController? userNameController;
  TextEditingController? passwordController;
  bool? isLoading;

  bool? isShow;

  LoginState(
      {this.isShow = false,
      this.userNameController,
      this.passwordController,
      this.isLoading = false}) {
    userNameController ??= TextEditingController();
    passwordController ??= TextEditingController();
  }

  LoginState copyWith({bool? visible, loading}) {
    return LoginState(
        isShow: visible ?? isShow,
        userNameController: userNameController,
        passwordController: passwordController,
        isLoading: loading ?? isLoading);
  }
}
