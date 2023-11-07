import 'package:atin_todo/controller/controller.dart';
import 'package:get/get.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}

class put {}
