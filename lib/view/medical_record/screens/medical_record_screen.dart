// medical_record_screen.dart
import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/medical_record/screens/widgets/Adding_record_widget.dart';

class MedicalRecordScreen extends StatelessWidget {
  const MedicalRecordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      drawer:CustomDrawer(),
      child: AppGeneralInfo(
        appTopBarText: "Medical Records",
        iconPath: AppAssets.bookPen,
        title: AppStrings.medicalRecordsTiltle,
        showSubtitle: true,
        subTitle: AppStrings.medicalRecordsSubTitle,
        buttonText: "Add a record",
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
    );
  }
}