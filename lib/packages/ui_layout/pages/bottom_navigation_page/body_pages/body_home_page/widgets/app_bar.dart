import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/news_page/news_page.dart';
import 'package:kaizen/packages/ui_layout/widgets/end_drawer/end_drawer_app_bar.dart';

class MySliverHomeAppBar extends StatelessWidget {
  const MySliverHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: TextButton(
        onPressed: () {
          Get.toNamed(NewsPage.id);
        },
        child: FittedBox(
          child: Text(
            'News',
            style: Theme.of(context).textTheme.headline6,
          ),
        ), //const FaIcon(FontAwesomeIcons.newspaper, size: 15),
      ),
      actions: [
        MyEndDrawer.openEndDrawer(),
      ],
      toolbarHeight: 35,
      // expandedHeight: 35,
      floating: true,
      pinned: true,
      //что эпп бар будет зафиксен после скролла
      title: Text(
        'Kaizen',
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: Theme.of(context).primaryColor),
      ),
      // flexibleSpace: FlexibleSpaceBar(
      //   centerTitle: true,
      //   title: Text(
      //     'Kaizen',
      //     style: Theme.of(context)
      //         .textTheme
      //         .headline5
      //         ?.copyWith(color: Theme.of(context).primaryColor),
      //   ),
      //   // background: Image.network(
      //   //   'https://picsum.photos/500/800',
      //   //   fit: BoxFit.cover,
      //   // ),
      // ),
    );
  }
}
