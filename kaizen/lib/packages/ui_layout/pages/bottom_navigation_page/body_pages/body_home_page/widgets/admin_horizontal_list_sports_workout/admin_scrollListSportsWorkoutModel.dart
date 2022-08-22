import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/src/getX/getx_controllers/app_controller/implement_getx_state_management.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_new_workout/create_workout_page.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/admin_horizontal_list_sports_workout/admin_horizontal_list_sports_workout_model.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';

class AdminScrollListSportsWorkoutModel extends StatelessWidget {
  AdminScrollListSportsWorkoutModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementAppStateGetXController>(
      builder: (_controller) {
        return SizedBox(
          height: _controller.myUser != null &&
                  _controller.myUser!.listWorkoutWheIAdmin!.isNotEmpty
              ? MediaQuery.of(context).size.width / 2.5
              : MediaQuery.of(context).size.width / 7,
          child: _controller.myUser != null &&
                  _controller.myUser!.listWorkoutWheIAdmin!.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.myUser!.listWorkoutWheIAdmin!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 18.0, top: 8, bottom: 8),
                      child: Row(
                        children: [
                          Container(
                            decoration: myStyleContainer(
                              context: context,
                            ),
                            child: AdminHorizontalCardWidget(
                              index: index,
                            ),
                          ),
                          if (index ==
                              _controller.myUser!.listWorkoutWheIAdmin!.length -
                                  1)
                            // _addNewSportWorkout(context),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Center(
                                child: _addNewSportWorkout(context),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Center(
                    child: _addNewSportWorkout(context),
                  ),
                ),
        );
      },
    );
  }

  _addNewSportWorkout(context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Theme.of(context).cardColor,
      child: FaIcon(
        FontAwesomeIcons.add,
        // size: ,
        color: Theme.of(context).textTheme.headline2!.color,
      ),
      onPressed: () {
        Get.to(() => CreateWorkoutPage());
      },
    );
  }
}
