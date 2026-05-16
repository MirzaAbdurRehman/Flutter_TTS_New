import 'package:first_app/api_screens/customer_FetchApi.dart';
import 'package:first_app/screens/image_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'custom_scrollbar.dart';

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
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ImagePickerScreen()));
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
