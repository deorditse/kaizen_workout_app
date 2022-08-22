import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/model/lib/src/sports_page/sports_workout_model.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/old/pages/Test_calendars_page/controller/calendar_page_controller.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/main_sports_page.dart';

class BodySportsPage extends StatefulWidget {
  BodySportsPage({Key? key, this.dataSportsWorkout}) : super(key: key);
  SportsWorkoutModel? dataSportsWorkout;

  @override
  State<BodySportsPage> createState() => _BodySportsPageState();
}

class _BodySportsPageState extends State<BodySportsPage> {
  @override
  void initState() {
    super.initState();
    Get.put(TableBasicsController());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SportsPage(
        dataSportsWorkout: widget.dataSportsWorkout,
      ),
    );
  }
}
