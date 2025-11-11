import 'package:adv/core/exports/ui_exports.dart';

// jsut call it in the button like this:
// AppButton(buttonHeight: 54, buttonText: "logout", textStyle: AppTextStyles.buttonText(context), onTap: () {
//             Get.dialog(
//               LogoutShowDialog(
//                 onConfirm: () {
//                   //  logout logic here
//                   print('User logged out!');
//                   Get.snackbar('Logged out', 'You have been logged out');
//                 },
//               ),
//               barrierDismissible: true,
//               barrierColor: Colors.transparent,
//             );
//           },
//           )
class LogoutShowDialog extends StatelessWidget {
  final String? text;
  final String? title;

  final VoidCallback onConfirm;

  const LogoutShowDialog({
    super.key,
    required this.onConfirm,
    this.text,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(204, 0, 0, 0),
                  Color.fromARGB(204, 0, 0, 0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Container(
              width: context.w(335),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text( title??
                    "Log Out",
                    style: AppTextStyles.titleText(context)
                        .copyWith(fontSize: context.sp(26)),
                  ),
                  Text( text??
                    'Are you sure you want to logout?',
                    style: AppTextStyles.hintText(context)
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Cancel',
                          style: AppTextStyles.greenText(context).copyWith(
                              fontSize: context.sp(16),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          
                          Get.back();
                          onConfirm();
                        },
                        child: Text(
                          'Ok',
                          style: AppTextStyles.greenText(context).copyWith(
                              fontSize: context.sp(16),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
