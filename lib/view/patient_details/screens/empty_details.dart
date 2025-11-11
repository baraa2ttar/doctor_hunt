import 'package:adv/core/exports/ui_exports.dart';

class EmptyDetails extends StatelessWidget {
  const EmptyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      drawer:CustomDrawer(),
      child: AppGeneralInfo(showSubtitle: false));
  }
}
