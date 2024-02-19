import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';

List<String> names = [
  "Mahaa.candle",
  "Webq.co",
  "germany.lang",
  "Fati_76__",
  "Abed.kamali",
  "sam_karman",
  "Alirezaaa",
  "Arezooo",
  "NiuShaa"
];

// ignore: must_be_immutable
class ShareScreen extends StatelessWidget {
  ShareScreen({super.key, required this.controller});
  ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(36),
        topRight: Radius.circular(36),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 30,
          sigmaX: 30,
        ),
        child: Container(
          color: Colors.white.withOpacity(0.4),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CustomScrollView(
                controller: controller,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    sliver: SliverToBoxAdapter(
                      child: _headerItems(),
                    ),
                  ),
                  _gridContent(),
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 110),
                  ),
                ],
              ),
              Positioned(
                bottom: 47,
                child: SizedBox(
                  height: 46,
                  width: 129,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Send"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerItems() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          height: 5,
          width: 67,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Share",
              style: TextStyle(
                fontFamily: "GB",
                fontSize: 24,
                color: MyColor.textColor,
              ),
            ),
            Image.asset("images/icon_share_bottomsheet.png"),
          ],
        ),
        const SizedBox(height: 28),
        Container(
          height: 46,
          width: 340,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset("images/icon_search.png"),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: MyColor.textColor,
                      fontFamily: "GM",
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search...",
                      hintStyle: TextStyle(
                        color: MyColor.textColor,
                        fontFamily: "GB",
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _gridContent() {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 32, left: 30, right: 30),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("images/share_screen_icon$index.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  names[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: MyColor.textColor,
                    fontFamily: "GB",
                    fontSize: 12,
                  ),
                ),
              ],
            );
          },
          childCount: 9,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 115,
        ),
      ),
    );
  }
}
