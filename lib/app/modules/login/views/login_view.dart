import 'package:alura_challenge_mobile/app/global_widgets/button.dart';
import 'package:alura_challenge_mobile/app/global_widgets/input.dart';
import 'package:alura_challenge_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth / 7),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Input(
                    controller: controller.usernameController,
                    hintText: 'Username',
                    validator: controller.validatorUsername,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Input(
                    controller: controller.passwordController,
                    hintText: 'Password',
                    isPassword: true,
                    validator: controller.validatorPassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<LoginController>(
                    builder: (controller) => controller.isLoading
                        ? Button(
                            text: 'Wait...',
                            onClick: () => controller.login(),
                          )
                        : Button(
                            text: 'Login',
                            onClick: () => controller.login(),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
