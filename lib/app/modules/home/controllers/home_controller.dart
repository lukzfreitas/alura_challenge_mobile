import 'package:alura_challenge_mobile/app/data/models/extract_model.dart';
import 'package:alura_challenge_mobile/app/data/providers/extract_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  ExtractProvider extractProvider;

  HomeController(this.extractProvider);  

  Future<ExtractModel> extractController() async {
    DateTime dateNow = DateTime.now();
    return await extractProvider.extractProvider(dateNow.month, dateNow.year);    
  }
}