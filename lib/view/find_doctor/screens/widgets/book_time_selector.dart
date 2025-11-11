import 'package:adv/view/find_doctor/screens/widgets/select_book_time.dart';

import '../../../../core/exports/ui_exports.dart';

class BookTimeSelector extends StatelessWidget {
  const BookTimeSelector(
      {super.key,
      required this.onTap,
      required this.selectedIndex,
      required this.itemCount});
  final void Function(int) onTap;
  final int selectedIndex;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return SelectBookTime(
            availableSlots: AppConstants.availableSlotsList[index],
            bookDate: AppConstants.bookingDates[index],
            onTap: () => onTap(index),
            isSelected: selectedIndex == index,
          );
        },
      ),
    );
  }
}
