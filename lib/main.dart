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
      primaryColor: const Color(0xffAB47BC),
      backgroundColor: const Color(0xff373737),
    ),
  ));
}
