import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(), permanent: true);
  }
}
