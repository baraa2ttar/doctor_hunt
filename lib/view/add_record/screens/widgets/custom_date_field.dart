import 'package:intl/intl.dart';
import '../../../../core/exports/ui_exports.dart';

Widget CustomDateField() {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: DateTimeField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: SvgPicture.asset("assets/svgs/pen.svg", height: 14, width: 14),
          onPressed: () {},
        ),
      ),
      value: DateTime.now(),
      firstDate: DateTime.now(),
      dateFormat: DateFormat('dd MMM, yyyy'),
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: AppColor.primaryColor,
      ),
    ),
  );
}
