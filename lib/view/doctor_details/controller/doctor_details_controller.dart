import 'package:adv/view/popular_doctor/screens/popular_doctor_screen.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DoctorDetailsController extends GetxController {
  List<bool> isFavoriteList = List.generate(namesList1.length, (_) => false);

  void toggleFavorite(int index) {
    isFavoriteList[index] = !isFavoriteList[index];
    update();
  }
}
