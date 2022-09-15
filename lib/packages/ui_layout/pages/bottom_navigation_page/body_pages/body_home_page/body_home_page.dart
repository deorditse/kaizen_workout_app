import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/horizontal_lists_with_sport_workout/horizontal_list_sports_workout/horizontal_list_sports_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/app_bar.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/join_by_key_widget.dart';

import 'horizontal_lists_with_sport_workout/admin_horizontal_list_sports_workout/admin_horizontal_list_sports_workout.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const MySliverHomeAppBar(),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<ImplementAppStateGetXController>(
                builder: (controller) => SizedBox(
                  height:
                      controller.dataSportsWorkoutList.isNotEmpty ? 5 : 30,
                ),
              ),
              joinByKey(),
              Center(
                child: TextButton(
                  onPressed: _whereGetKey,
                  child: Text(
                    'Где взять ключ?',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Все тренировки',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        // Text('View all'),
                      ],
                    ),
                    Text(
                      'Редактирование недоступно',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),

              //getBuilder чтобы обновлять данные по мере их получения
              GetBuilder<ImplementAppStateGetXController>(
                builder: (_) => const HorizontalListSportsWorkout(),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Тренировки, созданные вами',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        // Text('View all'),
                      ],
                    ),
                    Text(
                      'Доступно для редактирования',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),
              AdminHorizontalListSportsWorkout(),
              // SizedBox(
              //   height: 100,
              // ),
            ],
          ),
        ),
      ],
    );
  }

  _whereGetKey() {
    return Get.defaultDialog(
      backgroundColor: myDefaultDialogBackground(context),
      titlePadding: EdgeInsets.only(
        top: 20,
      ),
      titleStyle: Theme.of(context).textTheme.headline1,
      title: "Где взять ключ?",
      // content: Text(usersInWorkout.cast().toList().toString()),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  '1. Если тренировку создаете Вы,то ключ доступа (для Ваших друзей) выдается в конце создания тренировки;\n2. Если тренировку создают Ваши друзья, ключ можно получить только от них.',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: 20,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.close(1);
                  },
                  child: FaIcon(
                    FontAwesomeIcons.key,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
