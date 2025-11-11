import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/doctors/controller/doctor_controller.dart';
import 'package:adv/view/doctors/screens/widgets/scrolling_labels.dart';

class LabelSelector extends StatelessWidget {
  final List<String> labels;

  const LabelSelector({super.key, required this.labels});

  @override
  Widget build(BuildContext context) {
    final DoctorsController controller = Get.find();

    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(labels.length, (index) {
          return ScrollingLabels(
            labelName: labels[index],
            isSelected: controller.selectedIndex.value == index,
            onTap: () => controller.selectLabel(index),
          );
        }),
      ),
    ));
  }
}
