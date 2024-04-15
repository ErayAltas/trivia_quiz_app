import 'package:get/get.dart';
import 'package:trivia_quiz_app/view/home.dart';
import 'package:trivia_quiz_app/view/base/base_viewmodel.dart';

class SplashViewModel extends BaseViewModel {
  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }

  void checkAuth() {
    Future.delayed(const Duration(milliseconds: 1800), () {
      Get.off(() => const HomePage());

      // FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      //   // log("user : $user");
      //   // if (user == null) {
      //   //   Get.off(() => const LoginView());
      //   // } else {
      //   //   // bool? isOnboardingShown = await CacheManager.getHiveValue(CacheManager.onboardingShown) ?? false;
      //   //   // if (isOnboardingShown ?? false) {
      //   //   //   Get.off(() => const MainView());
      //   //   // } else {
      //   //   //   Get.off(() => const OnboardingView());
      //   //   // }
      //   //   Get.off(() => const HomePage());
      //   // }
      //   Get.off(() => const HomePage());
      // });
    });
  }
}
