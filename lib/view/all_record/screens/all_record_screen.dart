import 'package:adv/core/exports/main_exports.dart';
import 'package:adv/view/all_record/screens/widgets/Custom_date_container.dart';
import '../../../core/exports/ui_exports.dart';

class AllRecordScreen extends StatelessWidget {
  AllRecordScreen({super.key});
  final AllRecordController controller = Get.put(AllRecordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.records.length,
          itemBuilder: (context, index) {
            final record = controller.records[index];
            return Card(

              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CustomDateContainer(date: record.date),
                       CustomNewContainer(),
                      ],
                    ),
                    SizedBox(width: 16), // Space between date and text
                    Expanded( // Use Expanded to take remaining space
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Records added by you',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Record for ${record.name}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            record.prescriptions,
                            style: TextStyle(color: AppColor.greyColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    //add  list here
                    // Space for the "NEW" container

                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}