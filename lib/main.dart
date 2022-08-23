import 'package:alura_challenge_mobile/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main() async { 

  runApp(
    GetMaterialApp(
      title: 'Alura Challenge',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN, 
      getPages: AppPages.routes,
    )
  );
}