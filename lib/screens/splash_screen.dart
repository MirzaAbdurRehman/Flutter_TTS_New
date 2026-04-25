import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Home/home.dart';
import 'bottom_navigation_bar/bottom_navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Future.delayed(
        Duration(seconds: 6), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()));
    }
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffffffff),
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset(
          'assets/animations/ecom.json',
          width: 400,
          height: 400,
          repeat: true,
          reverse: true,
          fit: BoxFit.cover,
        )
      ),
    );
  }
}
