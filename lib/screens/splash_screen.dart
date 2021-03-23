
import 'package:bliss_challenge/helpers/constants.dart';
import 'package:bliss_challenge/helpers/strings.dart';
import 'package:bliss_challenge/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: textWhite,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Strings.BLISS_LOGO,
                scale: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((_) {
      Get.offAll(() => MainScreen());
    });
  }
}