import 'package:adv/core/exports/ui_exports.dart';

class SpecialtiesRow extends StatelessWidget {
  final List<String> specialtiesImages;

  const SpecialtiesRow({super.key, required this.specialtiesImages});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(specialtiesImages.length, (index) {
          return Container(
            width: 75.w,
            height: 90.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: AssetImage(specialtiesImages[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }
}