import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/medicine_order/screens/widgets/MedicineCard.dart';
import '../controller/MedicineOrderController.dart';

class MedicineOrderListScreen extends StatelessWidget {
  const MedicineOrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MedicineOrderController());
    final searchController = TextEditingController();

    return AppBackground(
      drawer:CustomDrawer(),
      child: Column(
        children: [
          AppTopBar(appBarText: "Medicines orders"),
          const SizedBox(height: 25),

          Obx(() {
            searchController.text = controller.searchText.value;
            searchController.selection = TextSelection.fromPosition(
              TextPosition(offset: searchController.text.length),
            );

            return AppSearchBar(
              controller: searchController,
              onChanged: controller.updateSearchText,
              onClear: controller.clearSearchText,
              fillColor: Colors.white,
              borderRadius: 12,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 0),
                ),
              ],
              iconColor: AppColor.darkGreyColor,
            );
          }),

          const SizedBox(height: 25),

          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 20,
            children: [
              MedicineCard(
                svgAssetPath: AppAssets.guideIcon,
                title: "Guide to medicine order",
                onTap: () {},
              ),
              MedicineCard(
                svgAssetPath: AppAssets.excel,
                title: "Prescription related issues",
                onTap: () {},
              ),
              MedicineCard(
                svgAssetPath: AppAssets.orederstatusIcon,
                title: "Order status",
                onTap: () {},
              ),
              MedicineCard(
                svgAssetPath: AppAssets.orderdeliveryIcon,
                title: "Order delivery",
                onTap: () {},
              ),
              MedicineCard(
                svgAssetPath: AppAssets.paymentIcon,
                title: "Payments & Refunds",
                onTap: () {},
              ),
              MedicineCard(
                svgAssetPath: AppAssets.returnIcon,
                title: "Order returns",
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
