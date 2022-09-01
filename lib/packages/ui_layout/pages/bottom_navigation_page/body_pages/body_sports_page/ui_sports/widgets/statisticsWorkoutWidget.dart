import 'package:flutter/material.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';

Widget statisticsWorkout() {
  return Builder(
    builder: (BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        // key: key,
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
                        style: Theme.of(context).textTheme.headline2!.copyWith(
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
  );
}
