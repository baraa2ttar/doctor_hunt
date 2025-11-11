import '../../../core/exports/ui_exports.dart';
import 'package:adv/view/add_record/screens/widgets/custom_text_field.dart';
import '../../all_record/controller/all_record_controller.dart';
class AddRecordScreen extends StatelessWidget {
  final AllRecordController controller = Get.put(AllRecordController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AddRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CustomBottomSheet.show(
        child: Form(
          // Wrap the ListView in a Form widget
          key: _formKey, // Assign the GlobalKey to the Form
          child: ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'Record for',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    nameController: controller.namecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name ';
                      }
                      return null; // Input is valid
                    },
                  ),

                  SizedBox(height: 18.h),
                  Row(
                    children: [
                      Text(
                        'Type of record',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  CustomIconButtons(
                    svgPaths: controller.svgPaths,
                    textPaths: controller.textPaths,
                    selectButton: controller.selectedIndex.call,
                    selectedIndex: controller.selectedIndex,
                  ),
                  SizedBox(height: 20),
                  Divider(
                    thickness: 0.8,
                    color: AppColor.blackColor.withOpacity(0.1),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Record created on',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  CustomDateField(),
                  Divider(
                    thickness: 0.8,
                    color: AppColor.blackColor.withOpacity(0.1),
                  ),
                  SizedBox(height: 20),
                  AppButton(
                    borderRadius: 12.r,
                    buttonHeight: 54,
                    buttonWidth: 270,
                    buttonText: "Upload record",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with further actions
                        Get.toNamed(Routes.allRecord);
                      }
                      controller.addRecord(
                        controller.namecontroller.text,
                        "2025-07-15T11:05:00Z",
                      );
                    },
                    textStyle: TextStyle(color: AppColor.whiteColor),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
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
                child: ImageCart(imagePath: "assets/images/11.jpg"),
              ),
              AddMore(),
            ],
          ),
        ],
      ),
    );
  }
}
