import 'package:adv/core/exports/ui_exports.dart';

class BookingTimeGrid extends StatelessWidget {
  const BookingTimeGrid({
    super.key,
    required this.timeSlots,
    required this.onTap,
    required this.selectedIndex,
  });
  final List<String> timeSlots;
  final Function(int) onTap;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 4,
            childAspectRatio: 2.13),
        itemCount: timeSlots.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              alignment: Alignment.center,
              width: 76.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? AppColor.primaryColor
                      : AppColor.primaryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(6.r)),
              child: Text(timeSlots[index],
                  style: AppTextStyles.buttonText(context).copyWith(
                      fontSize: 13.sp,
                      color: selectedIndex == index
                          ? AppColor.whiteColor
                          : AppColor.primaryColor)),
            ),
          );
        },
      ),
    );
  }
}
