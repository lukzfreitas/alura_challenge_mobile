import 'package:alura_challenge_mobile/app/global_widgets/button.dart';
import 'package:alura_challenge_mobile/app/global_widgets/input.dart';
import 'package:alura_challenge_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:alura_challenge_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
                    text: 'Login',
                    onClick: () async {
                      bool response = await controller.singInController(
                        controller.usernameController.text,
                        controller.passwordController.text,
                      );
                      if (response) {
                        // goes to the next page and remove previous one
                        Get.offAndToNamed(Routes.HOME);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
