import 'package:adv/core/exports/ui_exports.dart';

class PatientDetailsForm extends StatelessWidget {
  const PatientDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final PatientDetailsController controller = Get.find();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Patient's Name",
            style: AppTextStyles.titleText(
              context,
            ).copyWith(fontSize: context.sp(14)),
          ),
          SizedBox(height: 8.h),
          Obx(
            () => AppTextFormField(
              hintText: "Enter the patient name",
              onChanged: controller.onNameChanged,
              errorText: controller.nameError.value,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "Age",
            style: AppTextStyles.titleText(
              context,
            ).copyWith(fontSize: context.sp(14)),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => BorderedDropdown(
                    hint: 'Day',
                    items: AppConstants.dayOptions,
                    selectedValue: controller.selectedDay.value.isEmpty
                        ? null
                        : controller.selectedDay.value,
                    onChanged: controller.onDayChanged,
                  ),
                ),
              ),
              SizedBox(width: 8.w), // some horizontal spacing

              Expanded(
                child: Obx(
                  () => BorderedDropdown(
                    hint: 'Month',
                    items: AppConstants.monthOptions,
                    selectedValue: controller.selectedMonth.value,
                    onChanged: controller.onMonthChanged,
                  ),
                ),
              ),
              SizedBox(width: 8.w),

              Expanded(
                child: Obx(
                  () => BorderedDropdown(
                    hint: 'Year',
                    items: AppConstants.yearOptions,
                    selectedValue: controller.selectedYear.value,
                    onChanged: controller.onYearChanged,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            "Gender",
            style: AppTextStyles.titleText(
              context,
            ).copyWith(fontSize: context.sp(14)),
          ),
          SizedBox(height: 8.h),
          RadioGenderSelector(),
          SizedBox(height: 12.h),
          Text(
            "Mobile Number",
            style: AppTextStyles.titleText(
              context,
            ).copyWith(fontSize: context.sp(14)),
          ),
          SizedBox(height: 8.h),
          Obx(
            () => AppTextFormField(
              keyboardType: TextInputType.phone,
              hintText: "+880110000000000",
              onChanged: controller.onMobileChanged,
              errorText: controller.mobileError.value,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "Email",
            style: AppTextStyles.titleText(
              context,
            ).copyWith(fontSize: context.sp(14)),
          ),
          SizedBox(height: 8.h),
          Obx(
            () => AppTextFormField(
              hintText: "Enter the patient's email",
              keyboardType: TextInputType.emailAddress,
              onChanged: controller.onEmailChanged,
              errorText: controller.emailError.value,
            ),
          ),
        ],
      ),
    );
  }
}
