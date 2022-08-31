import 'package:alura_challenge_mobile/app/global_widgets/button.dart';
import 'package:alura_challenge_mobile/app/global_widgets/input.dart';
import 'package:alura_challenge_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  login() async {
    bool response = await controller.singInController(
      controller.usernameController.text,
      controller.passwordController.text,
    );
    controller.loading = true;
    if (response) {
      // Get.offAndToNamed(Routes.HOME);
      controller.usernameController.text = '';
      controller.passwordController.text = '';
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Advice',
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
    controller.loading = false;
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
                child: Button(
                  text: controller.loading ? 'Loading...' : 'Login',
                  onClick: () => login(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
