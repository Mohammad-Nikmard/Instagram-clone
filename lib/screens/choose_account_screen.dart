import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:instagram/screens/main_screen.dart';

class ChooseAccountScreen extends StatelessWidget {
  const ChooseAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: _getContent(context),
    );
  }

  Widget _getContent(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset("images/switch_account_background.png"),
                Positioned(
                  top: 250,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        height: 352,
                        width: 340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: buttonColor,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2),
                            ],
                          ),
                        ),
                        child: _containerInfo(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _bottomText(context),
      ],
    );
  }

  Widget _containerInfo(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32),
        Container(
          height: 129,
          width: 129,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage("images/my_profile.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Mohammad_Nikmard",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 46,
          width: 129,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
              );
            },
            child: Text(
              "Confirm",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        SizedBox(height: 32),
        Text(
          "Switch accound",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }

  Widget _bottomText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 63, top: 145),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? / ",
              style: TextStyle(
                fontFamily: "GB",
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            Text(
              "Sign up",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
