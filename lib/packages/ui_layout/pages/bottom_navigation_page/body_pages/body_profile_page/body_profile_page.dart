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
