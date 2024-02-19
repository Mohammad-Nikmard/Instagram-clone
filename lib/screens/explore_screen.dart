import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _searchBox(),
            _categories(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/item$index.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 18,
                ),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _categories() {
    List<String> categories = [
      "All",
      "Account",
      "Hashtag",
      "Caption",
      "Story",
      "Comment",
      "Fun",
      "Drake",
      "The Rock",
      "Tom Ellis"
    ];
    return SliverPadding(
      padding: EdgeInsets.only(left: 17, right: 17, bottom: 20),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 23,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  height: 23,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFF272B40),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _searchBox() {
    return SliverPadding(
      padding: EdgeInsets.only(top: 20, left: 17, right: 17, bottom: 20),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 46,
          width: 394,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Color(0xFF272B40),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset("images/icon_search.png"),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12,
                      fontFamily: "GB",
                    ),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search...",
                      hintStyle: TextStyle(
                        color: textColor,
                        fontFamily: "GB",
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Image.asset("images/icon_scan.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
