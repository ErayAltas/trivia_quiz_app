import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia_quiz_app/view/auth/login/login_viewmodel.dart';
import 'package:trivia_quiz_app/view/base/base_screen.dart';
import 'package:trivia_quiz_app/view/base/base_view.dart';
import 'package:trivia_quiz_app/widgets/custom_elevated_button.dart';
import 'package:trivia_quiz_app/widgets/custom_textformfield.dart';

enum LoginOrSignUp { login, signup }

final class LoginView extends BaseScreen<LoginViewModel> {
  const LoginView({super.key});

  @override
  LoginViewModel createViewModel(BuildContext context) => LoginViewModel();

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: vmR(context).formKey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const AppLogo(),
                    const SizedBox(height: 40),
                    Text(
                      vmW(context).loginOrSignUp == LoginOrSignUp.login ? 'welcomeBack'.tr : 'createAccount'.tr,
                      style: Get.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    if (vmW(context).loginOrSignUp == LoginOrSignUp.signup) const NameField(),
                    if (vmW(context).loginOrSignUp == LoginOrSignUp.signup) const SizedBox(height: 10),
                    const EmailField(),
                    const SizedBox(height: 10),
                    const PasswordField(),
                    const SizedBox(height: 25),
                    const AuthButton(),
                    const SizedBox(height: 40),
                    Text('orContinueWith'.tr),
                    const SizedBox(height: 30),
                    const SignupSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthButton extends BaseView<LoginViewModel> {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      text: vmW(context).loginOrSignUp == LoginOrSignUp.login ? 'signIn'.tr : "signUp".tr,
      onPressed: () {
        if (vmR(context).formKey.currentState!.validate()) {
          vmR(context).formKey.currentState!.save();
        } else {
          return;
        }
        if (vmR(context).loginOrSignUp == LoginOrSignUp.login) {
          vmR(context).login(LoginType.email);
        } else {
          vmR(context).createAccount();
        }
      },
    );
  }
}

class PasswordField extends BaseView<LoginViewModel> {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "passwordRequired".tr;
        }
        return null;
      },
      hintText: 'password'.tr,
      prefixIcon: const Icon(Icons.lock),
      controller: vmR(context).passwordController,
      obscureText: vmW(context).isObscure,
      maxLines: 1,
      suffixWidget: IconButton(
        onPressed: vmR(context).toogleObscure,
        icon: Icon(
          vmW(context).isObscure ? Icons.visibility_off : Icons.visibility,
          color: Get.iconColor,
          size: 22,
        ),
      ),
    );
  }
}

class SignupSection extends BaseView<LoginViewModel> {
  const SignupSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(vmW(context).loginOrSignUp == LoginOrSignUp.login ? 'dontHaveAccount'.tr : 'alreadyHaveAccount'.tr),
        const SizedBox(width: 10),
        TextButton(
          onPressed: vmR(context).toggleLoginOrSignUp,
          child: Text(vmW(context).loginOrSignUp == LoginOrSignUp.login ? "signUp".tr : 'signIn'.tr),
        ),
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      height: 200,
      width: 200,
    );
  }
}

class EmailField extends BaseView<LoginViewModel> {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "emailRequired".tr;
        }
        return null;
      },
      hintText: 'emailAddress'.tr,
      prefixIcon: const Icon(Icons.email),
      controller: vmR(context).emailController,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class NameField extends BaseView<LoginViewModel> {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "nameRequired".tr;
        }
        return null;
      },
      hintText: 'name'.tr,
      prefixIcon: const Icon(Icons.person),
      controller: vmR(context).nameController,
      keyboardType: TextInputType.name,
    );
  }
}
