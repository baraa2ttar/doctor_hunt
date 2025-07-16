import 'package:adv/core/exports/main_exports.dart';
import 'package:adv/view/add_record/controller/add_record_controller.dart';
import 'package:adv/view/add_record/screens/widgets/add_more.dart';
import 'package:adv/view/add_record/screens/widgets/app_image_cart.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
import '../../../core/exports/ui_exports.dart';

class AddRecordScreen extends StatelessWidget {
  final AddRecordController controller = Get.put(AddRecordController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      CustomBottomSheet.show(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'record for',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            TextField(
              style: TextStyle(color: AppColor.primaryColor, fontSize: 18),
              decoration: InputDecoration(
                // Focused border
                border: InputBorder.none,
                suffix: Icon(Icons.edit, color: Colors.black45),
              ),
            ),
            SizedBox(height: 20),
            Container(height: 1, width: 335, color: Colors.black12),
            SizedBox.fromSize(size: Size.fromHeight(15)),
            Row(
              children: [
                Text(
                  'Type of record ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(controller.svgPaths.length, (index) {
                    return Obx(
                      () => Row(
                        children: [
                          Column(
                            children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  controller.svgPaths[index],
                                  height: 23,
                                  width: 17,
                                  color:
                                      controller.selectedIndex.value == index
                                          ? Colors.green
                                          : Colors.grey,
                                ),

                                // Change the icon as needed
                                onPressed: () {
                                  controller.selectButton(index);
                                },
                              ),
                              Text(controller.TextPaths[index]),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(20)),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: 47),
            Container(height: 1, width: 335, color: Colors.black12),
            Padding(padding: EdgeInsets.all(20)),
            Row(
              children: [
                Text(
                  'Record created on',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(20)),
            DateTimeField(
              decoration: InputDecoration(suffixIcon: Icon(Icons.edit)),
              value: DateTime.now(),
              firstDate: DateTime.now(),

      dateFormat: DateFormat(('dd MMM, yyyy')),
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: AppColor.primaryColor),

            ),
            SizedBox(height: 20),

            AppButton(buttonHeight: 54,buttonText: "Upload record",onTap: (){},textStyle: TextStyle()),
            SizedBox(height: 20),
          ],
        ),
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
