import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';

defaultDialogAllProgramWorkout({required context, required indexSportWorkout}) {
  final sportWorkout = ImplementAppStateGetXController
      .instance.dataSportsWorkoutList[indexSportWorkout];
  return Get.defaultDialog(
    backgroundColor: myDefaultDialogBackground(context),
    // titlePadding: EdgeInsets.only(
    //   top: 20,

    // ),
    title: "Программа тренировок",
    titleStyle: Theme.of(context).textTheme.headline1!,
    // content: Text(usersInWorkout.cast().toList().toString()),
    content: SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width,
      child: Container(
        height: MediaQuery.of(context).size.height, //* 0.5,
        child: ListView.builder(
          itemCount: sportWorkout.descriptionWorkoutList.length,
          itemBuilder: (BuildContext context, int index) {
            final description = sportWorkout.descriptionWorkoutList[index];


            return Card(
              color: DateTime.now().isUtc
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.7),
                      radius: 22,
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            DateFormat('d MMM').format(sportWorkout
                                .firstWorkoutDay
                                .add(Duration(days: index))),
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${description}' ?? 'нет данных',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}

//
// class DefaultDialogAllProgramWorkout extends StatelessWidget {
//   const DefaultDialogAllProgramWorkout({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: myStyleContainer(context: context),
//       // width: MediaQuery.of(context).size.width *
//       //     0.75, // here i set width of container to 75% of screen
//       height: MediaQuery.of(context).size.height * 0.25,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               // flex: 2,
//               child: Column(
//                 children: [
//                   Center(
//                     child: Text(
//                       'Выполнили задачу 3/10',
//                       style: Theme.of(context).textTheme.headline1,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       // shrinkWrap: true,
//                       itemCount: 6,
//                       itemBuilder: (BuildContext context, int index) =>
//                           FittedBox(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(bottom: 3.0),
//                                   child: CircleAvatar(
//                                     radius: 22,
//                                     backgroundImage: NetworkImage(
//                                       'https://picsum.photos/1200/501',
//                                     ),
//                                   ),
//                                 ),
//                                 FittedBox(
//                                     child: Padding(
//                                       padding:
//                                       const EdgeInsets.symmetric(horizontal: 8.0),
//                                       child: Text(
//                                         'Дмитрий Деордице',
//                                         style: Theme.of(context).textTheme.headline2,
//                                       ),
//                                     ))
//                               ],
//                             ),
//                           ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 children: [
//                   Divider(),
//                   Center(
//                     child: Text(
//                       'Не выполнили',
//                       style: Theme.of(context).textTheme.headline1,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       //
//                       // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       //     crossAxisCount: 2),
//                       scrollDirection: Axis.horizontal,
//                       // shrinkWrap: true,
//                       itemCount: 12,
//                       itemBuilder: (BuildContext context, int index) =>
//                           FittedBox(
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 CircleAvatar(
//                                   // radius: 22,
//                                   backgroundImage: NetworkImage(
//                                     'https://picsum.photos/1200/501',
//                                   ),
//                                 ),
//                                 FittedBox(
//                                     child: Padding(
//                                       padding:
//                                       const EdgeInsets.symmetric(horizontal: 4.0),
//                                       child: Text(
//                                         'Фамилия имя $index',
//                                         style: Theme.of(context).textTheme.headline2,
//                                       ),
//                                     ))
//                               ],
//                             ),
//                           ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
