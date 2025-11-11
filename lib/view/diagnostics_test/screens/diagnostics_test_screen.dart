import 'package:adv/core/exports/ui_exports.dart';

class DiagnosticsTestScreen extends StatelessWidget {
  const DiagnosticsTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTopBar(appBarText: "Diagnostics Tests"),
          SizedBox(height: 20.h),
          Text(
            AppStrings.diagnosticsTitle,
            style: AppTextStyles.titleText(context),
          ),
          SizedBox(height: 10.h),
          Text(
            AppStrings.diagnosticsOff,
            style: AppTextStyles.greenText(context),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              DiagnosticsContainer(
                colorStart: AppColor.containerBlueColor,
                colorEnd: AppColor.containerPurpleColor,
                svgIcon: AppAssets.homeIcon,
                text: AppStrings.diagnosticsFirstSection,
              ),
              Spacer(),
              DiagnosticsContainer(
                colorStart: AppColor.containerRedColor,
                colorEnd: AppColor.containerOrangeColor,
                svgIcon: AppAssets.listenIcon,
                text: AppStrings.diagnosticsSecondSection,
              ),
            ],
          ),
          SizedBox(height: 30.h),

          Row(
            children: [
              DiagnosticsContainer(
                colorStart: AppColor.containerDarkOrangeColor,
                colorEnd: AppColor.containerYellowColor,
                svgIcon: AppAssets.timeIcon,
                text: AppStrings.diagnosticsThirdSection,
              ),
              Spacer(),
              DiagnosticsContainer(
                colorStart: AppColor.containerDarkGreenColor,
                colorEnd: AppColor.containerGreenColor,
                svgIcon: AppAssets.lookIcon,
                text: AppStrings.diagnosticsFourthSection,
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Text(AppStrings.recommended, style: AppTextStyles.doctorNameText(context).copyWith(fontWeight: FontWeight.w700),),
          SizedBox(height: 20.h),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: diagnosticsList.length,
            itemBuilder: (context, index) {
              final item = diagnosticsList[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 20.h), // spacing between cards
                child: DiagnosticsCard(
                  cardTitle: item['cardTitle'],
                  cardSubtitle: item['cardSubtitle'],
                  numberOfTests: item['numberOfTests'],
                  image: item['image'],
                  price: item['price'],
                  offPrice: item['offPrice'],
                  percentageOff: item['percentageOff'],
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}