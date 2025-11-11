import '../../../../core/exports/ui_exports.dart';

class AddMore extends StatelessWidget {
  const AddMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 125.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
          color: AppColor.primaryColor.withOpacity(0.2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 20.h),
          Icon(Icons.add, size: 50, color: AppColor.primaryColor),
          Text(
            "Add more images",
            textAlign: TextAlign.center,
            style: AppTextStyles.title(context)
                .copyWith(height: 1.1.h, color: AppColor.primaryColor),
          ),
          SizedBox(height: 13.h)
        ],
      ),
    );
  }
}
