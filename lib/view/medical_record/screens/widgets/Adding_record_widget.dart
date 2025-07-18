import '../../../../core/exports/ui_exports.dart';

class AddingRecordWidget extends StatelessWidget {
  final String imagePath;
  final text;

  AddingRecordWidget({super.key, required this.imagePath, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          SvgPicture.asset("$imagePath", height: 14, width: 14),
          SizedBox(width: 13),
          Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,
            color: AppColor.darkGreyColor

            ),
          ),
        ],
      ),
    );
  }
}
