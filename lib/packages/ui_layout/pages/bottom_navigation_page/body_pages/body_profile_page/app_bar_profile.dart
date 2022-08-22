import 'package:flutter/material.dart';
import 'package:kaizen/packages/ui_layout/widgets/end_drawer/end_drawer_app_bar.dart';

SliverAppBar mySliverProfileAppBar(context) => SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
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
        MyEndDrawer.openEndDrawer(color: Theme.of(context).cardColor),
      ],
      toolbarHeight: 35,
      floating: true,
      pinned: true,
      title: Text(
        'Профиль',
        style: TextStyle(color: Theme.of(context).cardColor),
      ),
      //что эпп бар будет зафиксен после скролла
      // expandedHeight: 100,

      // flexibleSpace: FlexibleSpaceBar(
      //   collapseMode: CollapseMode.none,
      //       centerTitle: true,
      //       background: Image.network(
      //         'https://picsum.photos/500/800',
      //         fit: BoxFit.cover,
      //       ),
      //     ),
    );
