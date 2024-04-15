import 'package:flutter/material.dart';
import 'package:trivia_quiz_app/service/auth_service.dart';
import 'package:trivia_quiz_app/view/auth/login/login_view.dart';
import 'package:trivia_quiz_app/view/base/base_viewmodel.dart';

enum LoginType { email }

class LoginViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService firebaseAuthService = AuthService();
  LoginOrSignUp loginOrSignUp = LoginOrSignUp.login;
  bool isObscure = true;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onDispose() {
    super.onDispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  Future<void> createAccount() async {
    await firebaseAuthService.createUserWithEmailAndPassword(emailController.text, passwordController.text);
    // if (user != null) {
    //   AppConstant.userId = user.user!.uid;
    //   await userRef.doc(user.user!.uid).set(UserModel(
    //         userId: user.user!.uid,
    //         name: nameController.text,
    //         email: user.user!.email,
    //       ));
    // }
  }

  void login(LoginType loginType) {
    switch (loginType) {
      case LoginType.email:
        firebaseAuthService.signInWithEmailAndPassword(emailController.text, passwordController.text);
        break;
    }
  }

  void toggleLoginOrSignUp() {
    loginOrSignUp == LoginOrSignUp.login ? loginOrSignUp = LoginOrSignUp.signup : loginOrSignUp = LoginOrSignUp.login;
    notifyListeners();
  }

  void toogleObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
