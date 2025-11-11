import '../../../../core/exports/ui_exports.dart';

class ImageCart extends StatelessWidget {
  final String? imagePath;

  const ImageCart({super.key, this.imagePath});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(6.0),
        topRight: Radius.circular(6.0),
        bottomLeft: Radius.circular(6.0),
        bottomRight: Radius.circular(6.0),
      ),
      child: Image.asset(imagePath ?? "assets/images/11.jpg",
          width: 100, height: 125, fit: BoxFit.fill),
    );
  }
}
