import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:instagram/screens/choose_account_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  FocusNode? myfocusNode1;
  FocusNode? myfocusNode2;
  @override
  void initState() {
    myfocusNode1 = FocusNode();
    myfocusNode2 = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    myfocusNode1!.dispose();
    myfocusNode2!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _topDesign(),
          _bottomDesign(),
        ],
      ),
    );
  }

  Widget _topDesign() {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF323A99),
                  Color(0xFFF98BFC),
                ],
              ),
            ),
            child: Image.asset("images/rocket.png"),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: MyColor.textColor,
          ),
        ),
      ],
    );
  }

  Widget _bottomDesign() {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(),
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: const BoxDecoration(
              color: MyColor.backColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign in to",
                      style: TextStyle(
                        color: MyColor.textColor,
                        fontFamily: "GB",
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Image.asset("images/mood.png")
                  ],
                ),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: myfocusNode1,
                    onTap: () {
                      setState(() {
                        FocusScope.of(context).requestFocus(myfocusNode1);
                      });
                    },
                    style: const TextStyle(
                      color: MyColor.textColor,
                      fontFamily: "GM",
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: myfocusNode1!.hasFocus
                            ? MyColor.buttonColor
                            : MyColor.textColor,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: MyColor.textColor,
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: MyColor.buttonColor,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: myfocusNode2,
                    onTap: () {
                      setState(() {
                        FocusScope.of(context).requestFocus(myfocusNode2);
                      });
                    },
                    style: const TextStyle(
                      color: MyColor.textColor,
                      fontFamily: "GM",
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: myfocusNode2!.hasFocus
                            ? MyColor.buttonColor
                            : MyColor.textColor,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: MyColor.textColor,
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: MyColor.buttonColor,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 46,
                  width: 129,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChooseAccountScreen(),
                        ),
                      );
                    },
                    child: const Text("Sign in"),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
