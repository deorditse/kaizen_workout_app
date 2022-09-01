import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/consts_app.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';

class ListUsersCompletedTaskForDay extends StatelessWidget {
  const ListUsersCompletedTaskForDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myStyleContainer(context: context),
      // width: MediaQuery.of(context).size.width *
      //     0.75, // here i set width of container to 75% of screen
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              // flex: 2,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Выполнили задачу 3/10',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) =>
                          FittedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3.0),
                              child: CircleAvatar(
                                radius: 22,
                                backgroundImage: NetworkImage(
                                  'https://picsum.photos/1200/501',
                                ),
                              ),
                            ),
                            FittedBox(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Дмитрий Деордице',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Divider(),
                  Center(
                    child: Text(
                      'Не выполнили',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      //
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2),
                      scrollDirection: Axis.horizontal,
                      // shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (BuildContext context, int index) =>
                          FittedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              // radius: 22,
                              backgroundImage: NetworkImage(
                                'https://picsum.photos/1200/501',
                              ),
                            ),
                            FittedBox(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                'Фамилия имя $index',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget listUsersCompletedTaskForDay1(context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width *
        0.75, // here i set width of container to 75% of screen
    height: MediaQuery.of(context).size.height * 0.25,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          // flex: 2,
          child: ListView.builder(
            // gridDelegate:
            //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/1200/501',
                    ),
                  ),
                ),
                FittedBox(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Дмитрий Деордице',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ))
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Divider(),
              Center(
                child: Text(
                  'Не выполнили',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  //
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2),
                  scrollDirection: Axis.horizontal,
                  // shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) => FittedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          // radius: 22,
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/1200/501',
                          ),
                        ),
                        FittedBox(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            'Фамилия имя $index',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

listUsersCompletedTaskForDay({
  required context,
  Set<User>? usersInWorkout,
}) {
  return Get.defaultDialog(
    backgroundColor: myDefaultDialogBackground(context),
    titlePadding: EdgeInsets.only(
      top: 20,
    ),
    title: "Выполнили задачу",
    // content: Text(usersInWorkout.cast().toList().toString()),
    content: SizedBox(
      height: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              // flex: 2,
              child: ListView.builder(
                // gridDelegate:
                //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                scrollDirection: Axis.horizontal,
                // shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/1200/501',
                        ),
                      ),
                    ),
                    FittedBox(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Дмитрий Деордице',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Divider(),
                  Center(
                    child: Text(
                      'Не выполнили',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      //
                      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2),
                      scrollDirection: Axis.horizontal,
                      // shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (BuildContext context, int index) =>
                          FittedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              // radius: 22,
                              backgroundImage: NetworkImage(
                                'https://picsum.photos/1200/501',
                              ),
                            ),
                            FittedBox(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                'Фамилия имя $index',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
