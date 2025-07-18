import '../../../../core/exports/ui_exports.dart';

class CustomDateContainer extends StatelessWidget {
  final String date  ;
  const CustomDateContainer({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            date,

            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColor.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
