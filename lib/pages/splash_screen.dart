import 'package:flutter/material.dart';
import 'package:states_capital_city/app/app.dart';
import 'package:states_capital_city/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const MyApp(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Image(
            //  width: double.infinity,
            height: 70,
            fit: BoxFit.contain,
            color: AppColors.white,
            image: AssetImage(
              'assets/images/geografia.png',
            ),
          ),
        ),
      ),
    );
  }
}
