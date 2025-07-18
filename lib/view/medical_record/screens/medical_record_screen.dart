import 'package:adv/core/exports/main_exports.dart';

import '../../../core/exports/ui_exports.dart';
import '../../../widgets/app_general_info.dart';

class MedicalRecordScreen extends StatelessWidget {
  const MedicalRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  AppBackground(
        child: Column(
          children: [
            AppGeneralInfo(
              appTopBarText: "Medical Records",
              iconPath: AppAssets.medicalIcon,
              title:"Add a medical record." ,
              subTitle: "A detailed health history helps a doctor diagnose you btter.",
              onTap: ()=> CustomBottomSheet.show(
                  child: Column(children: [

                    Container(width: 130,
                        child: Divider(color: AppColor.lightgrayColor,thickness: 5,radius: BorderRadius.circular(6),height: 20, )),
SizedBox(height: 18),
Padding(
  padding: const EdgeInsets.all(6),
  child: Row(children: [
    Text("Add a record",
      style:
        TextStyle(fontSize: 22, fontWeight: FontWeight.w400)
      )
  ],),
),
                    SizedBox(height: 20,),

                   AddingRecordWidget(imagePath: "assets/svgs/image.svg",text: "Take a photo"),
                   AddingRecordWidget(imagePath: "assets/svgs/galary.svg",text: "Upload from gallery"),
                   AddingRecordWidget(imagePath: "assets/svgs/file.svg",text: "Upload files"),
                  ],),
                ShadowIsTrue: true


              ),
            ),

          ],
        ),



    );

  }}




