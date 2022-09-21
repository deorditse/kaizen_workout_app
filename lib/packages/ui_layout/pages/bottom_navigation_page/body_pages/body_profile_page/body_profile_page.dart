import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/horizontal_lists_with_sport_workout/admin_horizontal_list_sports_workout/admin_horizontal_list_sports_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/horizontal_lists_with_sport_workout/horizontal_list_sports_workout/horizontal_list_sports_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_profile_page/app_bar_profile.dart';

class BodyProfilePage extends StatefulWidget {
  const BodyProfilePage({Key? key}) : super(key: key);

  @override
  State<BodyProfilePage> createState() => _BodyProfilePageState();
}

class _BodyProfilePageState extends State<BodyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      dragStartBehavior: DragStartBehavior.down,
      slivers: [
        const MySliverProfileAppBar(),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ProfileHeader(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: Text(
                  'Сюда можно вставить систему рейтинга или что-то из этой серии',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: Text(
                  'Тренировки, которые вы создали',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              AdminHorizontalListSportsWorkout(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: Text(
                  'История всех ваших тренировок',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const HorizontalListSportsWorkout(),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            leading: const CircleAvatar(
              radius: 30,
              // backgroundColor: Colors.grey,
              backgroundImage: NetworkImage('https://picsum.photos/1200/501'),
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
