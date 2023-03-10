import 'package:my_appls/templateProject/service/api_service.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CounterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
    Get.lazyPut(() => ApiService());
  }
}
