import 'package:adv/core/services/services.dart';
import 'package:adv/view/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageService>(() => StorageService());
  }
}
