import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_lists_with_sport_workout/widgets_horizontal_list/row_bottom_photo_list_users_in_workout_and_button.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_lists_with_sport_workout/widgets_horizontal_list/row_key_name_chat.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:model/model.dart'; //только так работает, так как на бизнес слое такой импорт - нужно чтобы совподало

class AdminWorkoutCard extends StatelessWidget {
  const AdminWorkoutCard(
      {Key? key, required this.indexInDataSportsWorkoutListWhenIAdmin})
      : super(key: key);

  final int indexInDataSportsWorkoutListWhenIAdmin;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementAppStateGetXController>(
      builder: (controllerApp) {
        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              child: LayoutBuilder(
                builder: (context, constrains) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: keyNameAndChat(
                        context: context,
                        index: indexInDataSportsWorkoutListWhenIAdmin,
                        isAdmin: true,
                      ),
                    ),
                    Expanded(
                      child: _centralContentWithStatusData(
                        indexInDataSportsWorkoutListWhenIAdmin:
                            indexInDataSportsWorkoutListWhenIAdmin,
                        context: context,
                      ),
                    ),
                    Expanded(
                      child: rowWithListUsersAndButton(
                        index: indexInDataSportsWorkoutListWhenIAdmin,
                        context: context,
                        constrains: constrains,
                        isAdmin: true,
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

  _centralContentWithStatusData(
      {required indexInDataSportsWorkoutListWhenIAdmin, required context}) {
    SportsWorkoutModel sportWorkout = ImplementAppStateGetXController
            .instance.dataSportsWorkoutListWhenIAdmin[
        indexInDataSportsWorkoutListWhenIAdmin];
    return GestureDetector(
      onTap: () {
        // Get.to(CreateWorkoutPage(sportsWorkoutModelForEdit: sportWorkout));
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Начало: ', style: Theme.of(context).textTheme.headline3!
                  // .copyWith(color: Theme.of(context).cardColor),
                  ),
              Text(DateFormat('d MMM y').format(sportWorkout.firstWorkoutDay),
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
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Theme.of(context).textTheme.headline1!.color),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
