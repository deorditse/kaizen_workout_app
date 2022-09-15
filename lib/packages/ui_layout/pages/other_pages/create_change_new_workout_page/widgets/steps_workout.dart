import 'package:flutter/material.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';

Widget steps() {
  return Builder(
    builder: (BuildContext context) {
      return Container(
        decoration: myStyleContainer(
          context: context,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: ExpansionTile(
          expandedAlignment: Alignment.center,
          title: Center(
            child:
                Text('Инструкция', style: Theme.of(context).textTheme.headline2!
                    // .copyWith(color: Theme.of(context).primaryColor),
                    ),
          ),
          // initiallyExpanded: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                '1. Выбрать дату начала тренировки;\n2. Выбрать дату окончания тренировки;\n3. Что делать каждый день?;\n4. Получить код доступа к тренировке для присоединения друзей.',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '*После создания тренировки вы станете администратором, только у вас будут права редактирования',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      );
    },
  );
}
