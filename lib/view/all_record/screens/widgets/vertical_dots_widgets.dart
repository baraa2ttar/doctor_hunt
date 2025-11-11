import '../../../../core/exports/ui_exports.dart';
import '../../../drawer/screens/widgets/logout_show_dialog.dart';

class VerticalDotsWidgets extends StatelessWidget {

  VoidCallback FetchRecord ;
  VoidCallback DeleteRecord  ;

  VerticalDotsWidgets({super.key,required this.FetchRecord, required this.DeleteRecord});


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        "assets/svgs/menu.svg",
        height: 20,
        width: 4,
        color: Colors.grey,
      ),
      onPressed: () {
        Get.dialog(
          LogoutShowDialog(
            text: "Are you sure you want to delete this record ?",
            title: "Delete Record ",
            onConfirm: () {
              print('Record deleted ');
              Get.snackbar('Record deleted', " ");
              DeleteRecord();
              FetchRecord();
            },
          ),
          barrierDismissible: true,
          barrierColor: Colors.transparent,
        );
        // Implement action for menu button
      },
    );
  }
}
