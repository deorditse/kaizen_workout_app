import 'package:flutter/material.dart';
import 'package:business_layout/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/widgets_for_all_pages/end_drawer/end_drawer_app_bar.dart';
import 'package:model/model.dart';

class MySliverProfileAppBar extends StatelessWidget {
  const MySliverProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shape: myStyleShapeBorder(),

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
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: true,
        background: Padding(
          padding: EdgeInsets.only(top: 80.0),
          child: _ProfileHeader(),
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

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? myUser = ImplementAppStateGetXController.instance.myUser;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 1.0],
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.3),
            Theme.of(context).primaryColor.withOpacity(1),
          ],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(),
          ListTile(
            onTap: () {},
            leading: CircleAvatar(
              radius: 30,
              // backgroundColor: Colors.grey,
              backgroundImage:
                  AssetImage(myUser?.photoPath ?? 'assets/images/anonim.png'),
              child: Text(''),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    'Фамилия Имя',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Theme.of(context).cardColor),
                  ),
                ),
                FittedBox(
                  child: Text(
                    'Управление аккаунтом',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Theme.of(context).cardColor),
                  ),
                ),
              ],
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).cardColor,
                )),
          ),
        ],
      ),
    );
  }
}
