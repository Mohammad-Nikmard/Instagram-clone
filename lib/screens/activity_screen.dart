import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:instagram/data/model/enums/activity_status.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 68,
              width: double.infinity,
              color: backColor,
              child: TabBar(
                labelStyle: TextStyle(fontFamily: "GB"),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 17),
                indicatorColor: buttonColor,
                controller: _controller,
                tabs: [
                  Tab(
                    text: "Following",
                  ),
                  Tab(
                    text: "You",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  _youTabContent(),
                  _youTabContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _youTabContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 32),
      child: CustomScrollView(
        slivers: [
          _customHeader("New"),
          _customList(ActivityStatus.FollowBack, 2),
          _customHeader("Today"),
          _customList(ActivityStatus.Liked, 4),
          _customHeader("This Month"),
          _customList(ActivityStatus.Follow, 6),
        ],
      ),
    );
  }

  Widget _customList(ActivityStatus status, int index) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: buttonColor,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("images/share_screen_icon6.png"),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Alirezaaa",
                          style: TextStyle(
                              color: textColor, fontFamily: "GB", fontSize: 12),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Started following",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "You",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "3 min",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                _activityStatus(status),
              ],
            ),
          );
        },
        childCount: index,
      ),
    );
  }

  Widget _activityStatus(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.Liked:
        return Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("images/item1.png"),
              fit: BoxFit.cover,
            ),
          ),
        );

      case ActivityStatus.Follow:
        return SizedBox(
          height: 36,
          width: 75,
          child: OutlinedButton(
            onPressed: () {},
            child: Text(
              "Message",
              style: TextStyle(
                color: greyColor,
                fontSize: 10,
                fontFamily: "GB",
              ),
            ),
          ),
        );

      case ActivityStatus.FollowBack:
        return SizedBox(
          height: 36,
          width: 70,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Follow",
              style: TextStyle(fontSize: 12),
            ),
          ),
        );
    }
  }

  Widget _customHeader(String text) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 13),
      sliver: SliverToBoxAdapter(
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}