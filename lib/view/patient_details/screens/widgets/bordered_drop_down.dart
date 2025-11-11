import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:adv/core/exports/ui_exports.dart';

class BorderedDropdown extends StatelessWidget {
  final String hint;
  final List<String> items;
  final String? selectedValue;
  final void Function(String?)? onChanged;

  const BorderedDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(hint, style: AppTextStyles.hintText(context).copyWith(fontWeight: FontWeight.w400, fontSize: context.sp(15)),),
        value: (selectedValue != null && items.contains(selectedValue)) ? selectedValue : null,
        items: items
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item, style: AppTextStyles.headline(context).copyWith(fontSize: context.sp(13)),),
        ))
            .toList(),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
               decoration: BoxDecoration(
            border: Border.all(color: AppColor.greyColor),
            borderRadius: BorderRadius.circular(6.r),
            color: Colors.white,
          ),
        ),
        iconStyleData:  IconStyleData(
          icon: Padding(
            padding:  EdgeInsets.only(right: 6.w),
            child: SvgPicture.asset(AppAssets.downIcon),
          ),
        ),
        dropdownStyleData: DropdownStyleData(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: AppColor.shadowBlueColor
          ),
        ),
      ),
    );
  }
}

