import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'city_selection_screen.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      _showCitySelectionDialog(context);
    });
  }

  Future<void> _showCitySelectionDialog(BuildContext context) async {
    final selectedCity = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const CitySelectionDialog();
      },
    );

    if (selectedCity != null && mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => MainScreen(city: selectedCity),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Lottie.asset("assets/shopping.json"),
      ),
    );
  }
}