import 'dart:math';
class HelperClass {
  static double generateRandomRating() {
    final random = Random();
    double rating = 1 + random.nextDouble() * 19; // بين 1 و 20
    return double.parse(rating.toStringAsFixed(2)); // تقريبه لرقمين بعد الفاصلة
  }

  static int generateRandomViews() {
    final random = Random();
    return 1000 + random.nextInt(1001); // من 1000 إلى 2000 (شاملة)
  }
}
