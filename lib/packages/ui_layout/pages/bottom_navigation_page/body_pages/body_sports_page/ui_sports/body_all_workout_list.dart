import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/consts_app.dart';
import 'package:kaizen/packages/model/lib/src/sports_page/sports_workout_model.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/calendar.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/app_bar_sports.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/difault_dialog_all_program_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/list_users_comleted_task_day.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';

class BodyAllWorkoutList extends StatefulWidget {
  BodyAllWorkoutList({Key? key, this.dataSportsWorkoutList}) : super(key: key);

  List<SportsWorkoutModel>? dataSportsWorkoutList;

  @override
  State<BodyAllWorkoutList> createState() => _BodyAllWorkoutListState();
}

class _BodyAllWorkoutListState extends State<BodyAllWorkoutList> {
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
              (widget.dataSportsWorkoutList != null) ||
                      widget.dataSportsWorkoutList!.isNotEmpty
                  ? ListView.builder(itemBuilder: (context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 7,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: widget.dataSportsWorkoutList!.length,
                          itemBuilder: (context, index) => Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundImage: NetworkImage(
                                    'https://picsum.photos/1200/501',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
