import 'package:flutter/material.dart';
import 'package:kaizen/packages/ui_layout/widgets/end_drawer/end_drawer_app_bar.dart';

import 'body_profile_page.dart';

class MySliverProfileAppBar extends StatelessWidget {
  const MySliverProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // backgroundColor: Colors.transparent,

      // leading: TextButton(
      //   onPressed: () {
      //     Get.to(() => NewsPage());
      //   },
      //   child: FittedBox(
      //     child: Text(
      //       'News',
      //       style: Theme.of(context).textTheme.headline6,
      //     ),
      //   ), //const FaIcon(FontAwesomeIcons.newspaper, size: 15),
      // ),
      actions: [
        MyEndDrawer.openEndDrawer(
            color: Theme.of(context).textTheme.headline1!.color),
      ],

      toolbarHeight: 35,
      floating: false,
      pinned: true,
      title: Text(
        'Профиль',
        style: TextStyle(
            color: Theme.of(context)
                .textTheme
                .headline1!
                .color), //Theme.of(context).textTheme.headline1,
      ),
      //что эпп бар будет зафиксен после скролла
      expandedHeight: 115,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Padding(
          padding: EdgeInsets.only(top: 80.0),
          child: ProfileHeader(),
        ),
        // Container(),
        // Image.network(
        //   'https://picsum.photos/500/800',
        // width: double.maxFinite,
        //   fit: BoxFit.cover,
        // ),
      ),

      // bottom: PreferredSize(
      //     child: ProfileHeader(),
      //     preferredSize: Size.fromHeight(80)),
    );
  }
}
