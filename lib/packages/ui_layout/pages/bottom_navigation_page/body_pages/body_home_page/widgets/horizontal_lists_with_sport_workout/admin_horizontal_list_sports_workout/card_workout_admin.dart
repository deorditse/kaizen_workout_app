import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_lists_with_sport_workout/widgets_horizontal_list/row_bottom_photo_list_users_in_workout_and_button.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_lists_with_sport_workout/widgets_horizontal_list/row_key_name_chat.dart';

class AdminWorkoutCard extends StatelessWidget {
  AdminWorkoutCard({Key? key, required this.index}) : super(key: key);

  final int index;
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementAppStateGetXController>(
      builder: (controllerApp) {
        final sportWorkout =
            controllerApp.dataSportsWorkoutListWhenIAdmin.elementAt(index);

        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: LayoutBuilder(
                builder: (context, constrains) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: keyNameAndChat(
                        context: context,
                        sportWorkout: sportWorkout,
                      ),
                    ),
                    Expanded(
                      child: _centralContentWithStatusData(
                        firstWorkoutDay: sportWorkout.firstWorkoutDay,
                        context: context,
                      ),
                    ),
                    Expanded(
                      child: rowWithListUsersAndButton(
                        index: index,
                        context: context,
                        sportWorkout: sportWorkout,
                        constrains: constrains,
                        buttonIsDelete: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _centralContentWithStatusData({required firstWorkoutDay, required context}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Начало: ', style: Theme.of(context).textTheme.headline3!
                // .copyWith(color: Theme.of(context).cardColor),
                ),
            Text(DateFormat('d MMM y').format(firstWorkoutDay!),
                style: Theme.of(context).textTheme.headline3!
                // .copyWith(color: Theme.of(context).cardColor),
                ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          decoration: myStyleContainer(
              context: context,
              color: Theme.of(context).scaffoldBackgroundColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'редактировать: ',
                style: Theme.of(context).textTheme.headline3!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
