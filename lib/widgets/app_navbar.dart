// import 'package:adv/core/constant/app_assets.dart';
// import 'package:adv/core/constant/app_colors.dart';
// import 'package:adv/view/diagnostics_test/screens/diagnostics_test_screen.dart';
// import 'package:adv/view/favourite_doctor/screens/favourite_doctor_screen.dart';
// import 'package:adv/view/home/screens/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class BottomNavbar extends StatefulWidget {
//   const BottomNavbar({super.key});
//
//   @override
//   State<BottomNavbar> createState() => _BottomNavbarState();
// }
//
// class _BottomNavbarState extends State<BottomNavbar> {
//   int _selectedIndex = 0;
//
//   final icons = [
//     AppAssets.homeIcon,
//     AppAssets.heartIcon,
//     AppAssets.bookIcon,
//     AppAssets.chatIcon,
//   ];
//
//   final screens = [
//    //  HomeScreen(),
//    //  FavouriteDoctorScreen(),
//    //  DiagnosticsTestScreen(),
//    //  SizedBox(),
//    //  SizedBox(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: screens[_selectedIndex],
//         bottomNavigationBar: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.2),
//                 blurRadius: 10,
//               ),
//             ],
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: List.generate(icons.length, (index) {
//               final isSelected = _selectedIndex == index;
//               return GestureDetector(
//                 key: ValueKey('nav_item_$index'),
//                 onTap: () {
//                   setState(() {
//                     _selectedIndex = index;
//                   });
//                 },
//                 child: AnimatedContainer(
//                   width: 48,
//                   height: 48,
//                   duration: const Duration(milliseconds: 200),
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color:
//                         isSelected ? AppColor.primaryColor : Colors.transparent,
//                     shape: BoxShape.circle,
//                   ),
//                   child: SvgPicture.asset(
//                     icons[index],
//                     colorFilter: ColorFilter.mode(
//                       isSelected
//                           ? AppColor.whiteColor
//                           : AppColor.navbarIconColor,
//                       BlendMode.srcIn,
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ),
//     );
//   }
// }
