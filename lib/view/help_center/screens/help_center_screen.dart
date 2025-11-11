import 'package:adv/core/exports/ui_exports.dart';
import 'package:adv/view/help_center/screens/widgets/CustomSearchField.dart';
import '../controller/HelpCenterController.dart';

class HelpCenterScreen extends StatelessWidget {
  final HelpCenterController controller = Get.put(HelpCenterController());

  HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      drawer:CustomDrawer(),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 👈 مهم جداً
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTopBar(appBarText: "Help Center"),
          const SizedBox(height: 30),
          CustomSearchField(
              controller: controller.searchController,
              hintText: "I have an issue with",
              onChanged: controller.filterOptions,
            ),
        
          const SizedBox(height: 10),
          Obx(() => Flexible(
                fit: FlexFit.loose,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.filteredOptions.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      controller.filteredOptions[index],
                      style: AppTextStyles.ListTitleStyle(context).copyWith(
                          fontSize: 17.sp,
                          color: AppColor.darkGreyColor.withOpacity(0.6)),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: AppColor.darkGreyColor,
                    ),
                    onTap: () => controller.handleOptionTap(index),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(),
                ),
              )),
        ],
      ),
    );
  }
}
