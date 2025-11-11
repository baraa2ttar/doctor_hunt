import 'package:adv/core/exports/main_exports.dart';
import 'package:adv/core/constant/app_assets.dart';

import '../../favourite_doctor/controller/favourite_doctor_controller.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  TextEditingController searchController = TextEditingController();
  void changeIndex(int index) {
    selectedIndex.value = index;
    if (index == 1) {
      Get.find<FavouriteDoctorController>().fetchDoctors();
    }
  }

  clearText() {
    searchController.clear();
    update();
  }

  final liveDoctorImages = <String>[
    AppAssets.img27,
    AppAssets.img16,
    AppAssets.img28,
  ];

  final popularDoctorNames = <String>['Dr. A', 'Dr. B'];

  final featuredDoctors = <FeaturedDoctor>[
    FeaturedDoctor(
      image: AppAssets.img2,
      name: 'Dr. Crick',
      price: '25.00/hour',
      rating: 3.7,
      isFavorite: false,
    ),
    FeaturedDoctor(
      image: AppAssets.img14,
      name: 'Dr. Strain',
      price: '22.00/hour',
      rating: 3.0,
      isFavorite: true,
    ),
    FeaturedDoctor(
      image: AppAssets.img3,
      name: 'Dr. Lachinet',
      price: '29.00/hour',
      rating: 2.9,
      isFavorite: false,
    ),
    FeaturedDoctor(
      image: AppAssets.img2,
      name: 'Dr. Lachinet',
      price: '29.00/hour',
      rating: 2.9,
      isFavorite: true,
    ),
  ];
}

class FeaturedDoctor {
  final String image;
  final String name;
  final String price;
  final double rating;
  final bool isFavorite;

  FeaturedDoctor({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.isFavorite,
  });
}
