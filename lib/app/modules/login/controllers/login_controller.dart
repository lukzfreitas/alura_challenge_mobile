import 'package:alura_challenge_mobile/app/data/providers/session_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  SessionProvider sessionProvider;

  LoginController(this.sessionProvider);

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

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

  Future<bool> singInController(String username, String password) async {
    return await sessionProvider.singInProvider(username, password);
  }

  String get error => sessionProvider.error;
}
