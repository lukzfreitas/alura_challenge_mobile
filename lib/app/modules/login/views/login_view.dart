import 'package:alura_challenge_mobile/app/global_widgets/button.dart';
import 'package:alura_challenge_mobile/app/global_widgets/input.dart';
import 'package:alura_challenge_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:alura_challenge_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  login() async {
    bool isOk = await controller.signInController(
      controller.usernameController.text,
      controller.passwordController.text,
    );
    if (isOk) {
      Get.offAndToNamed(Routes.home);
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Access Denied',
          message: controller.error,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          icon: const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          isDismissible: true,
          duration: const Duration(seconds: 4),
          padding: const EdgeInsets.only(
            top: 16,
            left: 32,
            right: 32,
            bottom: 16,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alura Challenge')),
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth / 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Input(
                  controller: controller.usernameController,
                  hintText: 'Username',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Input(
                  controller: controller.passwordController,
                  hintText: 'Password',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<LoginController>(
                  builder: (controller) => controller.isLoading
                      ? Button(
                          text: 'Wait...',
                          onClick: () => login(),
                        )
                      : Button(
                          text: 'Login',
                          onClick: () => login(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
