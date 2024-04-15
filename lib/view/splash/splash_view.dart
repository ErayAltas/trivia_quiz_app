import 'package:flutter/material.dart';
import 'package:trivia_quiz_app/view/base/base_screen.dart';
import 'package:trivia_quiz_app/view/splash/splash_viewmodel.dart';

class SplashView extends BaseScreen<SplashViewModel> {
  const SplashView({super.key});

  @override
  SplashViewModel createViewModel(BuildContext context) => SplashViewModel();

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset('assets/images/logo.png', width: 300, height: 300),
        ),
      ),
    );
  }
}
