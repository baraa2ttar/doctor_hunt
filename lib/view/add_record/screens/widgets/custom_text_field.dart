import 'package:adv/core/exports/ui_exports.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController nameController;
  final String? Function(String?)? validator;

  CustomTextField({
    Key? key,
    required this.nameController,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: nameController,
            style: TextStyle(color: AppColor.primaryColor, fontSize: 18),
            decoration: InputDecoration(
              hintText: 'Name ....',
              hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.sp),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: SvgPicture.asset(
                  "assets/svgs/pen.svg",
                  height: 14,
                  width: 14,
                ),
                onPressed: () {},
              ),
            ),
            validator: validator, // Use the validator passed in
          ),
        ),
        Divider(
          thickness: 0.8,
          color: AppColor.blackColor.withOpacity(0.1),
        ),
      ],
    );
  }
}