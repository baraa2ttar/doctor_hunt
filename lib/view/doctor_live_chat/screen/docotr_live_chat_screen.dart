import 'package:adv/core/exports/ui_exports.dart';

class DoctorLiveChatScreen extends StatelessWidget {
  final DoctorLiveChatController controller =
      Get.put(DoctorLiveChatController());

  DoctorLiveChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Stack(
        children: [
          // Background image
          // داخل Stack
          Positioned.fill(
            child: Image.asset(
              AppAssets.img1,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent.withOpacity(0.5),
                    AppColor.blackColor,
                  ],
                ),
              ),
            ),
          ),
          // Top bar
          Positioned(
            top: 50,
            left: 16,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: AppColor.darkGreyColor,
                    size: 14,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 16,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(AppAssets.img15),
            ),
          ),
          // Comments list
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Obx(() => ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: controller.comments.length,
                  padding:  const EdgeInsets.fromLTRB(16, 0, 16, 25),
                  // EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                   
                    final comment = controller
                        .comments[controller.comments.length - 1 - index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(comment['avatar']),
                            radius: 18,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(comment['name'],
                                      style: AppTextStyles.commentsnameStyle(
                                          context)),
                                  SizedBox(height: 2),
                                  Text(comment['comment'],
                                      style:
                                          AppTextStyles.commentstyle(context)),

                                      
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )),
          ),

          // SizedBox(height: 10.h),
          // Add comment box (replaced with custom widget)
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: CustomCommentField(
              onSend: (text) {
                controller.addComment(text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
