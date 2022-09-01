import 'package:flutter/material.dart';

import 'package:kaizen/packages/model/lib/src/sports_page/sports_workout_model.dart';

//страница пока что нигде не используется

class BodyAllWorkoutList extends StatefulWidget {
  BodyAllWorkoutList({Key? key, this.dataSportsWorkoutList}) : super(key: key);

  List<SportsWorkoutModel>? dataSportsWorkoutList;

  @override
  State<BodyAllWorkoutList> createState() => _BodyAllWorkoutListState();
}

class _BodyAllWorkoutListState extends State<BodyAllWorkoutList> {
  double heightPadding = 20;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // mySliverSportsAppBar(context, widget.dataSportsWorkoutList.),
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
