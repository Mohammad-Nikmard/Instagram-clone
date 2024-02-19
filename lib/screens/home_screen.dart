import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:instagram/screens/share_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: SizedBox(
          width: 128,
          height: 20,
          child: Image.asset("images/moodinger_logo.png"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("images/icon_direct.png"),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: backColor,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 13),
            sliver: SliverToBoxAdapter(
              child: _storyList(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _singlePostContent(context, index);
              },
              childCount: 6,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 50),
          ),
        ],
      ),
    );
  }

  Widget _storyList() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return index == 0
              ? _addStory(context)
              : _storyContent(context, index);
        },
      ),
    );
  }

  Widget _singlePostContent(BuildContext context, int index) {
    List<String> indexes = [
      "CBum",
      "Drake",
      "notristanTate",
      "Taylor Swift",
      "The Rock",
      "TomEllis"
    ];
    List<String> likeNumbers = [
      "900K",
      "4.5M",
      "600K",
      "6.5M",
      "4M",
      "400K",
    ];
    List<String> comments = [
      "100K",
      "1.5M",
      "50K",
      "3M",
      "1.5M",
      "80K",
    ];
    List<String> character = [
      "Professional athlete",
      "Famous Rapper",
      "Influencer",
      "Famous Singer",
      "Famous Actor",
      "Famous Actor",
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _storyForPost(index),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2),
                  Text(
                    indexes[index],
                    style: TextStyle(
                        fontFamily: "GB", fontSize: 12, color: textColor),
                  ),
                  SizedBox(height: 5),
                  Text(
                    character[index],
                    style: TextStyle(
                        fontFamily: "GB", fontSize: 12, color: textColor),
                  ),
                ],
              ),
              Spacer(),
              Image.asset("images/icon_menu.png"),
            ],
          ),
          SizedBox(height: 30),
          Container(
            height: 440,
            width: 440,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("images/${indexes[index]}.png"),
                ),
                Positioned(
                  bottom: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                      child: Container(
                        height: 46,
                        width: 340,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.5),
                              Colors.white.withOpacity(0.2),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset("images/icon_hart.png"),
                                  SizedBox(width: 6),
                                  Text(
                                    likeNumbers[index],
                                    style: TextStyle(
                                        fontFamily: "GB",
                                        fontSize: 14,
                                        color: textColor),
                                  ),
                                ],
                              ),
                              SizedBox(width: 40),
                              Row(
                                children: [
                                  Image.asset("images/icon_comments.png"),
                                  SizedBox(width: 6),
                                  Text(
                                    comments[index],
                                    style: TextStyle(
                                        fontFamily: "GB",
                                        fontSize: 14,
                                        color: textColor),
                                  ),
                                ],
                              ),
                              SizedBox(width: 31),
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: DraggableScrollableSheet(
                                          minChildSize: 0.2,
                                          initialChildSize: 0.4,
                                          maxChildSize: 0.9,
                                          builder: (context, controller) {
                                            return ShareScreen(
                                                controller: controller);
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Image.asset("images/icon_share.png"),
                              ),
                              SizedBox(width: 35),
                              Image.asset("images/icon_save.png"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _storyForPost(int index) {
    List<String> pics = [
      "profile_pic1.jpg",
      "profile_pic2.jpg",
      "profile_pic3.jpg",
      "profile_pic4.jpg",
      "profile_pic5.jpg",
      "profile_pic6.jpg",
    ];
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        color: buttonColor,
        dashPattern: [30, 10],
        radius: Radius.circular(12),
        padding: EdgeInsets.all(3),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          child: Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/${pics[index]}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _storyContent(BuildContext context, int index) {
    List<String> storyNames = [
      "",
      "CBum",
      "Drake",
      "notristanTate",
      "Taylor Swift",
      "The Rock",
      "TomEllis"
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: DottedBorder(
            borderType: BorderType.RRect,
            strokeWidth: 2,
            color: buttonColor,
            dashPattern: [40, 10],
            radius: Radius.circular(17),
            padding: EdgeInsets.all(3),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58,
                width: 58,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/profile_pic$index.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            storyNames[index],
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }

  Widget _addStory(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 17),
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(
                color: textColor,
                width: 2,
              ),
            ),
            child: Image.asset("images/icon_plus.png"),
          ),
          SizedBox(height: 10),
          Text(
            "Your Story",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
