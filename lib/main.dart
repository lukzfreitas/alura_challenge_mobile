import 'package:alura_challenge_mobile/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(GetMaterialApp(
    title: 'Alura Challenge',
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.login,
    getPages: AppPages.routes,
    theme: ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffAB47BC),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffAB47BC),
        ),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color(0xffAB47BC),
          ),
        ),
      ),
      buttonTheme: const ButtonThemeData(buttonColor: Color(0xffAB47BC)),
      primaryColor: const Color(0xffAB47BC),
      backgroundColor: const Color(0xff373737),
    ),
  ));
}
