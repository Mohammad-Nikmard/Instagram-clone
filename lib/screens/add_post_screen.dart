import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                _upperInfo(context),
                _singleContainer(),
                _postGrids(),
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 100),
                ),
              ],
            ),
            _bottomSheet(context),
          ],
        ),
      ),
    );
  }

  Widget _bottomSheet(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF272B40),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        width: double.infinity,
        height: 68,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Draft",
                style: TextStyle(
                    color: buttonColor, fontFamily: "GB", fontSize: 16),
              ),
              Text(
                "Gallery",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "Take",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _postGrids() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 128,
                width: 128,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/add_post_index$index.png"),
                  ),
                ),
              ),
            );
          },
          childCount: 9,
        ),
      ),
    );
  }

  Widget _singleContainer() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      sliver: SliverToBoxAdapter(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 375,
            width: 394,
            child: Image.asset("images/add_post_item.png"),
          ),
        ),
      ),
    );
  }

  Widget _upperInfo(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 17, right: 17, top: 28, bottom: 11),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Text(
              "Post",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(width: 15),
            Image.asset("images/icon_arrow_down.png"),
            Spacer(),
            Text(
              "Next",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(width: 15),
            Image.asset("images/icon_arrow_right_box.png"),
          ],
        ),
      ),
    );
  }
}
