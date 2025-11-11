import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import '../../../../core/exports/ui_exports.dart';

Widget CustomDateField() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: DateTimeField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(borderSide: BorderSide.none),
        suffixIcon: IconButton(
          icon: SvgPicture.asset("assets/svgs/pen.svg", height: 14, width: 14),
          onPressed: () {},
        ),
      ),
      initialValue: DateTime.now(),
      format: DateFormat('dd MMM, yyyy'),
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: AppColor.primaryColor,
      ),
      onShowPicker: (context, currentValue) async {
        return await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2100),
        );
      },
    ),
  );
}