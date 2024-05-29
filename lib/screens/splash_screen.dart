import 'package:crypto_hub/style/colors.dart';
import 'package:crypto_hub/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _colorUtils = ColorUtils();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 8), () {
      Get.to(const TabsScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/icon.png',
                width: 250,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Kenya\'s Highly Rated Cryptocurrency Exchange ',
                style: TextStyle(fontSize: 12, color: _colorUtils.text2),
              ),
            )
          ],
        ),
      ),
    );
  }
}