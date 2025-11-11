// file: doctor_live_chat_controller.dart
import 'package:get/get.dart';

import '../../../core/constant/app_assets.dart';

class DoctorLiveChatController extends GetxController {
  var comments = <Map<String, dynamic>>[].obs;
  var commentText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initial comments
    comments.addAll([
      {
        'name': 'Everhart Tween',
        'comment': 'Thanks for shareing doctor ❤️',
        'avatar': AppAssets.img19
      },
      {
        'name': 'Bonebrake Mash',
        'comment': 'They treat immune system disorders',
        'avatar': AppAssets.profile
      },
      {
        'name': 'Handler Wack',
        'comment': 'This is the largest directory 👍',
        'avatar': AppAssets.img9
      },
      {
        'name': 'Comfort Love',
        'comment': 'Depending on their education 😎',
        'avatar': AppAssets.img11
      }
    ]);
  }

  void addComment(String text) {
    if (text.trim().isEmpty) return;
    comments.add({
      'name': 'You',
      'comment': text,
      'avatar': 'assets/images/myAvatar.png',
    });
    commentText.value = '';
  }
}
