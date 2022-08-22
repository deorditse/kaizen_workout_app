import 'package:flutter/material.dart';
import 'package:kaizen/packages/ui_layout/widgets/end_drawer/end_drawer_app_bar.dart';

SliverAppBar mySliverChatAppBar(context) => SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: [
        MyEndDrawer.openEndDrawer(),
      ],
      toolbarHeight: 35,
      floating: true,
      pinned: true,
      title: Text(
        'Чат',
        style: TextStyle(color: Theme.of(context).textTheme.headline1!.color),
      ),
    );
