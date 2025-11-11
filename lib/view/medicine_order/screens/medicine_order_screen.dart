
import '../../../core/exports/ui_exports.dart';

class MedicineOrderScreen extends StatelessWidget {
  const MedicineOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      drawer:CustomDrawer(),
      child: AppGeneralInfo(
        appTopBarText: "Medicine Orders",
        buttonText: "Order medicines",
        onTap: ()=> Get.toNamed(Routes.location),
      iconPath: "assets/svgs/order.svg",
      title: "No orders placed yet",
        subTitle: "Place your first order now.",
        iconWidth: 87.w,
      ),
    );
  }
}
