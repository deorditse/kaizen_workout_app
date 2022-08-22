import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/admin_horizontal_list_sports_workout/admin_horizontal_list_sports_workout_model.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/admin_horizontal_list_sports_workout/admin_scrollListSportsWorkoutModel.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_list_sports_workout/scrollListSportsWorkoutModel.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_profile_page/app_bar_profile.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';

class BodyProfilePage extends StatefulWidget {
  const BodyProfilePage({Key? key}) : super(key: key);

  @override
  State<BodyProfilePage> createState() => _BodyProfilePageState();
}

class _BodyProfilePageState extends State<BodyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        mySliverProfileAppBar(context),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const CircleAvatar(
                        radius: 30,
                        // backgroundColor: Colors.grey,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/1200/501'),
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
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: Text(
                  'Сюда можно вставить систему рейтинга или что-то из этой серии',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              SizedBox(
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
              AdminScrollListSportsWorkoutModel(),
              SizedBox(
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
              ScrollListSportsWorkoutModel(),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
