import 'package:adv/core/exports/ui_exports.dart';

class RadioGenderSelector extends StatelessWidget {
  const RadioGenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final PatientDetailsController controller = Get.find();

    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: AppConstants.genderOptions.map((gender) {
            final isSelected = controller.selectedGender.value == gender;

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    splashColor: AppColor.primaryColor.withOpacity(0.2),
                    highlightColor: Colors.transparent,
                    onTap: () => controller.selectGender(gender),
                    child: Padding(
                      padding: EdgeInsets.all(8
                          .w), // INCREASES touch area without changing circle size
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        height: 18.h,
                        width: 18.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColor.darkGreyColor,
                            width: 1.2.w,
                          ),
                        ),
                        child: isSelected
                            ? Center(
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeOut,
                                  height: 11.h,
                                  width: 11.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                GestureDetector(
                  onTap: () => controller.selectGender(gender),
                  child: Text(
                    gender,
                    style: AppTextStyles.hintText(context),
                  ),
                ),
                SizedBox(width: 8.w),
              ],
            );
          }).toList(),
        ));
  }
}
