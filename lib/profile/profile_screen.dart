import 'package:flutter/material.dart';

import '../app_spacings.dart';
import '../constants.dart';
import '../models/highlight.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const _InstagramProfileAppBar(),
          const SliverToBoxAdapter(child: ProfileHeader()),
          SliverPersistentHeader(
            pinned: true,
            delegate: ProfileTabbar(
              child: Container(
                color: Colors.white,
                child: const TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.grid_on),
                    ),
                    Tab(
                      icon: Icon(Icons.assignment_ind_outlined),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: const TabBarView(
          children: [
            _ProfileGridView(),
            _ProfileGridView(),
          ],
        ),
      ),
    );
  }
}

class _ProfileGridView extends StatelessWidget {
  const _ProfileGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final post = posts[index];
        return Container(
          color: Colors.grey,
          child: Image.asset(
            post,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

class ProfileTabbar extends SliverPersistentHeaderDelegate {
  final Widget child;

  ProfileTabbar({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 48;

  @override
  // TODO: implement minExtent
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacings.l),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          _ProfileInfo(),
          SizedBox(height: AppSpacings.l),
          _ProfileBio(),
          SizedBox(height: AppSpacings.l),
          _ProfileButtons(),
          _StoryHighlights(),
        ],
      ),
    );
  }
}

class _StoryHighlights extends StatelessWidget {
  const _StoryHighlights({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: Highlight.highlights.length,
        itemBuilder: (BuildContext context, int index) {
          final highlight = Highlight.highlights[index];
          return Container(
            margin: const EdgeInsets.only(right: AppSpacings.l),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    height: 62,
                    width: 62,
                    padding: const EdgeInsets.all(AppSpacings.s),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey.shade300),
                        image: DecorationImage(
                          image: AssetImage(highlight.image),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacings.s),
                Text(
                  highlight.name,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProfileButtons extends StatelessWidget {
  const _ProfileButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacings.xl),
            ),
          ),
          child: Text(
            "Edit Profile",
            style: Theme.of(context).textTheme.button,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacings.xl),
                  ),
                ),
                child: Text(
                  "Ad Tools",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
            const SizedBox(width: AppSpacings.m),
            Expanded(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacings.xl),
                  ),
                ),
                child: Text(
                  "Insights",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
            const SizedBox(width: AppSpacings.m),
            Expanded(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacings.xl),
                  ),
                ),
                child: Text(
                  "Contact",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProfileBio extends StatelessWidget {
  const _ProfileBio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ali Ebadi",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacings.s),
        Text(
          "Software",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.grey),
        ),
        const SizedBox(height: AppSpacings.s),
        Text(
          """FLUTTER DEVELOPER
 📱برنامه نویس اندروید و آی‌اواس 📱
 💙 ابزار ها ، ترفند ها و تجربیات کاریم رو اینجا میزارم💙
🚀 برای هرگونه همکاری دایرکت بدید🚀""",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _ProfileImage(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _ProfileFollowersCountWidget(
                count: "30",
                title: "Posts",
              ),
              _ProfileFollowersCountWidget(
                count: "388",
                title: "Followers",
              ),
              _ProfileFollowersCountWidget(
                count: "191",
                title: "Following",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileFollowersCountWidget extends StatelessWidget {
  const _ProfileFollowersCountWidget({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  final String title, count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(title),
      ],
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
            image: DecorationImage(
              image: AssetImage(profileImage),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}

class _InstagramProfileAppBar extends StatelessWidget {
  const _InstagramProfileAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: Row(
        children: const [
          Text(
            "ebapp",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_box_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.dehaze_outlined),
        ),
      ],
    );
  }
}
