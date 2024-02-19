import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backColor,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, index) {
            return [
              _sliverAppBar(),
              _outerInfo(context),
              SliverToBoxAdapter(
                child: _storyList(),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarDelegate(
                  TabBar(
                    tabs: [
                      Tab(
                        icon: Image.asset("images/icon_tab_posts.png"),
                      ),
                      Tab(
                        icon: Image.asset("images/icon_tab_bookmark.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/item$index.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }, childCount: 18),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: const [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 17),
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/item$index.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }, childCount: 18),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: const [
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _outerInfo(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 66,
                  width: 66,
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColor.buttonColor, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      height: 66,
                      width: 66,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: AssetImage("images/my_profile.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                const Column(
                  children: [
                    SizedBox(height: 18),
                    Text(
                      "محمد برنامه نویس موبایل",
                      style: TextStyle(
                        color: MyColor.textColor,
                        fontFamily: "SM",
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Mohammad_Nikmard",
                      style: TextStyle(
                          color: Color(0xFFC4C4C4),
                          fontSize: 12,
                          fontFamily: "GB"),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset("images/icon_profile_edit.png"),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "برنامه نویسی یه تخصصه که عشق و تعهد میخواد. یه برنامه نویس با تعهد و منظم و باتجربه ی یک سال کار با فریم ورک فلاتر ",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontSize: 10,
                      color: MyColor.textColor,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    "👇نمونه کار های من در گیت هاب",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontSize: 10,
                      color: MyColor.textColor,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                Image.asset("images/icon_link.png"),
                const SizedBox(width: 5),
                const Text(
                  "yek.link/Mohammad",
                  style: TextStyle(
                      color: Colors.blue, fontFamily: "GB", fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 11),
            Row(
              children: [
                Image.asset("images/icon_job.png"),
                const SizedBox(width: 5),
                Text(
                  "Developer",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(width: 15),
                Image.asset("images/icon_location.png"),
                const SizedBox(width: 5),
                Text(
                  "IRAN",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  "18",
                  style: TextStyle(
                    fontFamily: "GB",
                    color: MyColor.textColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "posts",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(width: 15),
                const Text(
                  "1K",
                  style: TextStyle(
                    fontFamily: "GB",
                    color: MyColor.textColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "Followers",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(width: 15),
                const Text(
                  "116",
                  style: TextStyle(
                    fontFamily: "GB",
                    color: MyColor.textColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "Following",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Follow"),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: SizedBox(
                    height: 46,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Message",
                        style: TextStyle(
                          color: MyColor.greyColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _sliverAppBar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: MyColor.backColor,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          height: 13,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: MyColor.backColor,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset("images/icon_menu_profile.png"),
        ),
      ],
      expandedHeight: 173,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "images/profile_background.png",
          fit: BoxFit.cover,
        ),
      ),
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
                color: MyColor.textColor,
                width: 2,
              ),
            ),
            child: Image.asset("images/icon_plus.png"),
          ),
          const SizedBox(height: 10),
          Text(
            "Your Story",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  Widget _storyList() {
    List<String> highlights = [
      "",
      "Flutter",
      "Support",
      "Shopping",
      "Projects",
    ];
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return index == 0
              ? _addStory(context)
              : Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 64,
                        width: 64,
                        child: Image.asset("images/highlight$index.png"),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        highlights[index],
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar? _tabBar;
  TabBarDelegate(this._tabBar);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: MyColor.backColor,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar!.preferredSize.height;

  @override
  double get minExtent => _tabBar!.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
