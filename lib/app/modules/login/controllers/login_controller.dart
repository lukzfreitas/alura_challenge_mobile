import 'package:alura_challenge_mobile/app/data/providers/session_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  SessionProvider sessionProvider;

  LoginController(this.sessionProvider);

  bool isLoading = false;  

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

  void _updataIsLoading(bool status) {
    isLoading = status;
    update();
  }

  String get error => sessionProvider.error;
}
