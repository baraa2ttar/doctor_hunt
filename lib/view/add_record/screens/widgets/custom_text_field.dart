import '../../../../core/exports/ui_exports.dart';

Widget CustomTextField() {
  return Column(
    children: [
      TextField(
        style: TextStyle(color: AppColor.primaryColor, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          suffix: IconButton(
            icon: SvgPicture.asset(
              "assets/svgs/pen.svg",
              height: 14,
              width: 14,
            ),
            onPressed: () {},
          ),
        ),
      ),
      SizedBox(height: 20),
      Divider(color: Colors.black12),
    ],
  );
}
