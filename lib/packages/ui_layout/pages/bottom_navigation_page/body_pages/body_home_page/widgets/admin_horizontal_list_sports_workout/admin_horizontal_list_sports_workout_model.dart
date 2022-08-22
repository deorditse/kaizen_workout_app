import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/admin_horizontal_list_sports_workout/admin_popup_with_users_in_workout.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';

class AdminHorizontalCardWidget extends StatelessWidget {
  int index;
  final ImplementAppStateGetXController _controller = Get.find();

  AdminHorizontalCardWidget({Key? key, required this.index}) : super(key: key);
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    final sportsWorkoutModel =
        _controller.dataSportsWorkoutList.elementAt(index);
    // [index];
    return Center(
      child: Container(
        width: sportsWorkoutModel.usersInWorkout!.length > 1
            ? MediaQuery.of(context).size.width / 1.6
            : MediaQuery.of(context).size.width - 36,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: LayoutBuilder(
            builder: (context, constrains) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      child: Text(
                        'Ключ \n${sportsWorkoutModel.idWorkout}',
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          sportsWorkoutModel.nameWorkout.toString(),
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        child: GestureDetector(
                          onTap: () {
                            controllerSetting.currentTabIndex.value = 2;
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.message,
                                color: Theme.of(context).primaryColor,
                              ),
                              Text('Group chat'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: myStyleContainer(
                      context: context,
                      color: Theme.of(context).scaffoldBackgroundColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('редактировать: ',
                          style: Theme.of(context).textTheme.headline3!
                          // .copyWith(color: Theme.of(context).cardColor),
                          ),
                    ],
                  ),
                ),
                Container(
                  // decoration: myStyleContainer(
                  //     context: context, color: Theme.of(context).primaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Начало: ',
                          style: Theme.of(context).textTheme.headline3!
                          // .copyWith(color: Theme.of(context).cardColor),
                          ),
                      Text(
                          '${DateFormat('d MMM y').format(sportsWorkoutModel.firstWorkoutDay!)}',
                          style: Theme.of(context).textTheme.headline3!
                          // .copyWith(color: Theme.of(context).cardColor),
                          ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    adminPopupWithUsersInWorkout(
                      context: context,
                      nameWorkout: sportsWorkoutModel.nameWorkout,
                      usersInWorkout: sportsWorkoutModel.usersInWorkout!.cast(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          'Участников ${sportsWorkoutModel.usersInWorkout?.length}'),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: constrains.maxHeight / 6,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                sportsWorkoutModel.usersInWorkout?.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://picsum.photos/1200/501',
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Center(
    //   child: Container(
    //     width: sportsWorkoutModel.usersInWorkout!.length > 1
    //         ? MediaQuery.of(context).size.width / 1.5
    //         : MediaQuery.of(context).size.width / 1.4,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         ListTile(
    //           leading: FittedBox(
    //             child: Text(
    //               'Ключ \n${sportsWorkoutModel.idWorkout}',
    //             ),
    //           ),
    //           title: FittedBox(
    //             child: Text(
    //               sportsWorkoutModel.nameWorkout.toString(),
    //             ),
    //           ),
    //           trailing: FittedBox(
    //             child: Column(
    //               children: [
    //                 IconButton(
    //                   onPressed: () {},
    //                   icon: FittedBox(
    //                     child: FaIcon(
    //                       FontAwesomeIcons.message,
    //                       color: Theme.of(context).primaryColor,
    //                     ),
    //                   ),
    //                 ),
    //                 FittedBox(child: Text('chat')),
    //               ],
    //             ),
    //           ),
    //         ),
    //         ListTile(
    //           leading: Text(
    //             'Начало: ',
    //           ),
    //           title: Text(
    //             sportsWorkoutModel.firstWorkoutDay!.toLocal().toString(),
    //           ),
    //         ),
    //         ListTile(
    //           leading: Text(
    //               'Участников ${sportsWorkoutModel.usersInWorkout!.length}'),
    //           title: Container(
    //             height: 30,
    //             width: 200,
    //             child: ListView.builder(
    //               scrollDirection: Axis.horizontal,
    //               itemCount: sportsWorkoutModel.usersInWorkout!.length,
    //               itemBuilder: (context, index) => Padding(
    //                 padding: const EdgeInsets.only(right: 8.0),
    //                 child: CircleAvatar(
    //                   child: ClipRRect(
    //                     // borderRadius: BorderRadius.circular(30),
    //                     child: Image.network(
    //                       'https://picsum.photos/1200/501',
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
