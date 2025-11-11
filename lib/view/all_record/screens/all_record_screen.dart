import 'package:adv/view/all_record/controller/all_record_controller.dart';
import 'package:adv/view/all_record/screens/widgets/Custom_date_container.dart';
import 'package:adv/view/all_record/screens/widgets/Custom_new_container.dart';
import 'package:adv/view/all_record/screens/widgets/vertical_dots_widgets.dart';
import 'package:adv/view/medical_record/screens/widgets/Adding_record_widget.dart';
import '../../../../core/exports/ui_exports.dart';

class AllRecordScreen extends StatelessWidget {
  AllRecordScreen({super.key});
  final AllRecordController controller = Get.put(AllRecordController());

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Column(
        children: [
          AppTopBar(appBarText: "All Records"),
          SizedBox(height: 20.h),
          Obx(() {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.records.length,
              itemBuilder: (context, index) {
                final record = controller.records[index];
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CustomDateContainer(
                              date: record.createdAt.toLocal().toString(),
                            ), // Use createdAt
                            SizedBox(height: 6.h),
                            CustomNewContainer(),
                          ],
                        ),
                        SizedBox(width: 16), // Space between date and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Records added by you',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Record for ${record.name}',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w300,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "1 Prescription",
                              style: TextStyle(
                                color: AppColor.greyColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        Container(
                          child: VerticalDotsWidgets(
                            DeleteRecord:
                                () => controller.deleteRecord(record.id),
                            FetchRecord: () => controller.fetchRecords(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
          SizedBox(height: 300),
          AppButton(
            borderRadius: 6.r,
            buttonWidth: 270,
            buttonHeight: 54,
            buttonText: "Add a record",
            textStyle: TextStyle(color: AppColor.whiteColor),
            onTap:
                () => CustomBottomSheet.show(
              child: Column(
                children: [
                  SizedBox(
                    width: 130,
                    child: Divider(
                      color: AppColor.lightgrayColor,
                      thickness: 5,
                      height: 20,
                    ),
                  ),
                  SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      children: [
                        Text(
                          "Add a record",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  AddingRecordWidget(
                    imagePath: "assets/svgs/image.svg",
                    text: "Take a photo",
                  ),
                  AddingRecordWidget(
                    imagePath: "assets/svgs/galary.svg",
                    text: "Upload from gallery",
                  ),
                  AddingRecordWidget(
                    imagePath: "assets/svgs/uploadFile.svg",
                    text: "Upload files",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
