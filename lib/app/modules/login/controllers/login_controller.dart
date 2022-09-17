import 'package:alura_challenge_mobile/app/data/providers/session_provider.dart';
import 'package:alura_challenge_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  SessionProvider sessionProvider;

  LoginController(this.sessionProvider);

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>().obs;
  GlobalKey<FormState> get formKey => _formKey.value;

  final _usernameController = TextEditingController().obs;
  TextEditingController get usernameController => _usernameController.value;

  final _passwordController = TextEditingController().obs;
  TextEditingController get passwordController => _passwordController.value;

  final _usernameFocus = FocusNode().obs;
  FocusNode get usernameFocus => _usernameFocus.value;
  void setFocusOnUsername() {
    _passwordFocus.value.unfocus();
    _usernameFocus.value.requestFocus();
  }

  final _passwordFocus = FocusNode().obs;
  FocusNode get passwordFocus => _passwordFocus.value;
  void setFocusOnPassword() {
    _usernameFocus.value.unfocus();
    _passwordFocus.value.requestFocus();
  }

  String? validatorUsername() {
    if (usernameController.text.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? validatorPassword() {
    if (passwordController.text.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  Future<bool> signInController(String username, String password) async {
    _updataIsLoading(true);
    bool status = await sessionProvider.signInProvider(username, password);
    _updataIsLoading(false);
    if (status) {
      _usernameController.value.text = "";
      _passwordController.value.text = "";
    }
    return status;
  }

  login() async {
    if (formKey.currentState!.validate()) {
      bool isOk = await signInController(
        usernameController.text,
        passwordController.text,
      );
      if (isOk) {
        Get.offAndToNamed(Routes.home);
      } else {
        Get.showSnackbar(
          GetSnackBar(
            title: 'Access Denied',
            message: error,
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
  }

  void _updataIsLoading(bool status) {
    isLoading = status;
    update();
  }

  String get error => sessionProvider.error;
}
