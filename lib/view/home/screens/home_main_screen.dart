import 'package:adv/view/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return HomeScreen();
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            // statusBarColor: Color.fromARGB(255, 10, 203, 149),
            // statusBarIconBrightness: Brightness.light,
            ),
        child: Scaffold(
          body: HomeScreen(),
        ));
  }
}
