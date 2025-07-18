import 'package:adv/core/exports/main_exports.dart';
import 'package:adv/view/add_record/controller/add_record_controller.dart';

import '../../../core/exports/ui_exports.dart';

class AddRecordScreen extends StatelessWidget {
  final AddRecordController controller = Get.put(AddRecordController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      CustomBottomSheet.show(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text('Record for', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ],
            ),
            CustomTextField(),
            Row(
              children: [
                Text('Type of record', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ],
            ),
            CustomIconButtons(
              svgPaths: controller.svgPaths,
              textPaths: controller.textPaths,
              selectButton: controller.selectedIndex,
              selectedIndex: controller.selectedIndex,
            ),

            SizedBox(height: 20),
            Divider(color: Colors.black12,),
            Row(
              children: [
                Text('Record created on', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
              ]
            ),
            CustomDateField(),
            SizedBox(height: 20),
            AppButton(
              buttonHeight: 54,
              buttonText: "Upload record",
              onTap: () {
                Get.toNamed('/medicalRecord');

              },
              textStyle: TextStyle(color: AppColor.whiteColor),
            ),
            SizedBox(height: 20),
          ],
        ), ShadowIsTrue: null,
      );
    });

    return AppBackground(
      child: Column(
        children: [
          AppTopBar(appBarText: "Add Record"),
          SizedBox.square(dimension: 40),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ImageCart(imagePath: "assets/images/boy.jpg"),
              ),
              AddMore(),
            ],
          ),
        ],
      ),
    );
  }
}
