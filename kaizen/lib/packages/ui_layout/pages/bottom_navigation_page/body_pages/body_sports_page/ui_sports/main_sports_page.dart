import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/consts_app.dart';
import 'package:kaizen/packages/model/lib/src/sports_page/sports_workout_model.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/calendar.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/app_bar_sports.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/difault_dialog_all_program_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/list_users_comleted_task_day.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';

class SportsPage extends StatefulWidget {
  SportsPage({Key? key, this.dataSportsWorkout}) : super(key: key);

  SportsWorkoutModel? dataSportsWorkout;

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  double heightPadding = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        mySliverSportsAppBar(context),
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 140,
                //flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: myStyleContainer(context: context),
                    //color Header
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              // border: Border(
                              //   bottom: BorderSide(
                              //     width: 1,
                              //     color: Colors.lightGreen,
                              //     style: BorderStyle.solid,
                              //   ),
                              // ),
                              // color: Colors.green.withOpacity(0.6),
                              ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              child: Text(
                                'Задача на день',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 12,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                //  color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.defaultDialog(
                                    backgroundColor:
                                        myDefaultDialogBackground(context),
                                    titlePadding: EdgeInsets.only(
                                      top: 20,
                                    ),
                                    title: "Задача на день",
                                    content: SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.all(0),
                                        // height: 350,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Здесь будет выведена задача на день',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    titleStyle:
                                        Theme.of(context).textTheme.headline1,
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.1),
                                      border: Border(
                                        top: BorderSide.none,
                                        left: BorderSide(
                                          width: 4.0,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        right: BorderSide.none,
                                        bottom: BorderSide.none,
                                      ),
                                      // color: Colors.black.withOpacity(0.05),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            'Сюда выводится описание задачи на день',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              // Colors.green.shade700,
                                              fontSize: 14,
                                              //fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightPadding,
              ),
              Container(
                //flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20),
                    decoration: myStyleContainer(context: context),
                    child: Calendar(key: widget.key),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextButton(
                  onPressed: () {
                    defaultDialogAllProgramWorkout(
                        context: context,
                        descriptionWorkoutList: [],
                        start: null);
                  },
                  child: Text('Посмотреть всю программу'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  key: widget.key,
                  decoration: myStyleContainer(context: context),
                  // height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "🔥 Статистика 🔥",
                            style: Theme.of(context).textTheme.headline1,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Количество выполнений за все время:',
                              style: Theme.of(context).textTheme.headline2,
                              children: <TextSpan>[
                                TextSpan(
                                  text: "\n12 из 40",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightPadding,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListUsersCompletedTaskForDay(),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
