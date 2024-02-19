import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:instagram/screens/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/pattern1.png"),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Center(
                child: Image.asset("images/logo_splash.png"),
              ),
            ),
            const Positioned(
              bottom: 32,
              child: Column(
                children: [
                  Text(
                    "From",
                    style: TextStyle(
                      color: MyColor.greyColor,
                      fontFamily: "GB",
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Mohammad Nikmard",
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "GB",
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
